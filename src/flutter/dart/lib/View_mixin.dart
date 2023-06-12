/*
  This file is part of KDDockWidgets.

  SPDX-FileCopyrightText: 2019-2023 Klarälvdalens Datakonsult AB, a KDAB Group company <info@kdab.com>
  Author: Sérgio Martins <sergio.martins@kdab.com>

  SPDX-License-Identifier: GPL-2.0-only OR GPL-3.0-only

  Contact KDAB at <info@kdab.com> for commercial licensing options.
*/

import 'dart:ffi' as ffi;
import 'package:KDDockWidgets/DropArea.dart';
import 'package:KDDockWidgets/Platform.dart';
import 'package:KDDockWidgets/PositionedWidget.dart';
import 'package:KDDockWidgets/GlobalStringKey.dart';
import 'package:KDDockWidgets/WindowWidget.dart';
import 'package:KDDockWidgetsBindings/Bindings.dart' as KDDockWidgetBindings;
import 'package:KDDockWidgetsBindings/Bindings.dart';
import 'package:KDDockWidgetsBindings/Bindings_KDDWBindingsCore.dart'
    as KDDWBindingsCore;
import 'package:KDDockWidgetsBindings/Bindings_KDDWBindingsFlutter.dart'
    as KDDWBindingsFlutter;
import 'package:flutter/gestures.dart';

import 'package:flutter/material.dart' hide View;

class View_mixin {
  late final PositionedWidget flutterWidget;
  late final GlobalStringKey<PositionedWidgetState> widgetKey;
  late final KDDWBindingsFlutter.View kddwView;
  late final int m_id;
  static int m_nextId = 0;
  WindowWidget?
      windowWidget; // For now, while we don't have multi-window support

  Color m_color = Colors.red;
  bool m_fillsParent = false;
  String debugName = "";

  var childWidgets = <Widget>[];

  void initMixin(var kddwView,
      {required KDDWBindingsCore.View? parent,
      var color = Colors.transparent,
      var debugName = ""}) {
    m_id = View_mixin.m_nextId++;
    this.kddwView = kddwView;
    m_color = color;
    this.debugName = debugName;

    widgetKey = globalKeyForView();

    if (widgetKey.currentWidget == null) {
      flutterWidget = createFlutterWidget();
    } else {
      // unexpected, keys are unique
      assert(false);
    }

    if (parent != null) {
      // onChildAdded is not called automatically from C++ when in the View ctor
      // because there's no View_mixin yet. So do it here
      fromCpp(parent).onChildAdded(kddwView);
    }
  }

  GlobalStringKey<PositionedWidgetState> globalKeyForView() {
    return GlobalStringKey("KDDockWidgets_View_mixin-${m_id}");
  }

  QRect viewGeometry() {
    return kddwView.geometry();
  }

  /// Casts to our flutter::View class
  KDDWBindingsFlutter.View asFlutterView() {
    return KDDWBindingsFlutter.View.fromCache(kddwView.thisCpp);
  }

  void onFlutterMouseEvent(PointerEvent event) {
    int eventType = -1;
    if (event is PointerDownEvent) eventType = Event_Type.MouseButtonPress;
    if (event is PointerUpEvent) eventType = Event_Type.MouseButtonRelease;
    if (event is PointerMoveEvent) eventType = Event_Type.MouseMove;

    if (eventType == -1) {
      print("Unhandled mouse event!");
      return;
    }

    final bool leftIsPressed = event.buttons == kPrimaryButton;
    final localPos = QPoint.ctor2(
        event.localPosition.dx.toInt(), event.localPosition.dy.toInt());
    final globalPos =
        QPoint.ctor2(event.position.dx.toInt(), event.position.dy.toInt());

    asFlutterView().onMouseEvent(eventType, localPos, globalPos, leftIsPressed);
  }

  void onGeometryChanged() {
    final state = widgetKey.currentState;
    if (state != null) {
      state.updateSize();
    }

    if (windowWidget != null) {
      final windowState = (windowWidget!.key as GlobalStringKey).currentState;

      if (windowState != null) {
        (windowState as WindowWidgetState).onGeometryChanged();
      }
    }
  }

  static View_mixin fromCpp(KDDWBindingsCore.View? viewCpp) {
    return KDDWBindingsFlutter.View.fromCache(viewCpp!.thisCpp) as View_mixin;
  }

  void onChildAdded(KDDWBindingsCore.View? childViewCpp) {
    final View_mixin childView = fromCpp(childViewCpp);
    if (childWidgets.contains(childView.flutterWidget)) return;

    childWidgets.add(childView.flutterWidget);

    final state = widgetKey.currentState;
    if (state != null) {
      state.childrenChanged();
    }
  }

  void onChildRemoved(KDDWBindingsCore.View? childViewCpp) {
    final state = widgetKey.currentState;
    final View_mixin childView = fromCpp(childViewCpp);

    final bool removed = childWidgets.remove(childView.flutterWidget);

    if (state != null && removed) {
      state.childrenChanged();
    }
  }

  void onChildVisibilityChanged(KDDWBindingsCore.View? childViewCpp) {
    final state = widgetKey.currentState;
    final View_mixin childView = fromCpp(childViewCpp);

    if (!childWidgets.contains(childView.flutterWidget)) {
      print(
          "ASSERT! $flutterWidget does not contain ${childView.flutterWidget}! state=$state ; children={$childWidgets} ; childVisible=${childViewCpp!.isVisible()}");
      // assert(false); // Should we assert here ? TODOm3
      return;
    }

    if (state != null) {
      state.childrenChanged();
    }
  }

  raiseChild(KDDWBindingsCore.View? childViewCpp) {
    final View_mixin childView = fromCpp(childViewCpp);
    if (childWidgets.isEmpty) {
      print(
          "raiseChild: Unexpected empty children for $flutterWidget child=${childView.flutterWidget}");
      return;
    }

    /// Already raised
    if (childWidgets.last == childView.flutterWidget) return;

    if (childWidgets.remove(childView.flutterWidget)) {
      childWidgets.add(childView.flutterWidget);
      widgetKey.currentState?.childrenChanged();
    } else {
      print(
          "raiseChild: Could not find child=${childView.flutterWidget} in $flutterWidget");
    }
  }

  raiseWindow(KDDWBindingsCore.View? rootView) {
    // We only raise floating windows, not main windows
    if (rootView!.type() != Core_ViewType.FloatingWindow) return;

    final fw = rootView.asFloatingWindowController();
    Platform.plat().raiseFloatingWindow(fw);
  }

  bool isMounted() {
    return widgetKey.currentContext != null;
  }

  bool isDropArea() {
    return flutterWidget is DropAreaWidget;
  }

  QPoint mapToGlobal(QPoint localPt) {
    final box = widgetKey.currentContext?.findRenderObject() as RenderBox?;
    if (box == null) {
      print("mapToGlobal: Could not find render box for widget=$flutterWidget"
          "; context=${widgetKey.currentContext}; visible=${kddwView.isVisible()}");
      kddwView.dumpDebug();
      return QPoint();
    }

    final Offset global = box
        .localToGlobal(Offset(localPt.x().toDouble(), localPt.y().toDouble()));
    return QPoint.ctor2(global.dx.toInt(), global.dy.toInt());
  }

  QPoint mapFromGlobal(QPoint globalPt) {
    final box = widgetKey.currentContext?.findRenderObject() as RenderBox?;
    if (box == null) {
      print("mapFromGlobal: Could not find render box for widget=$flutterWidget"
          "; context=${widgetKey.currentContext}; visible=${kddwView.isVisible()}");
      return QPoint();
    }
    final Offset local = box.globalToLocal(
        Offset(globalPt.x().toDouble(), globalPt.y().toDouble()));
    return QPoint.ctor2(local.dx.toInt(), local.dy.toInt());
  }

  List<Widget> visibleChildWidgets() {
    return childWidgets.where((w) {
      return !(w as PositionedWidget).kddwView.kddwView.isExplicitlyHidden();
    }).toList();
  }

  PositionedWidget createFlutterWidget() {
    return PositionedWidget(this, key: widgetKey);
  }

  /// Returns the widget state associated with this view
  T? widgetState<T>() {
    return widgetKey.currentState as T?;
  }
}
