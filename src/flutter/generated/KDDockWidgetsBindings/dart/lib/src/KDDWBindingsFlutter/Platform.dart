/*
  This file is part of KDDockWidgets.

  SPDX-FileCopyrightText: 2019-2023 Klarälvdalens Datakonsult AB, a KDAB Group company <info@kdab.com>
  Author: Sérgio Martins <sergio.martins@kdab.com>

  SPDX-License-Identifier: GPL-2.0-only OR GPL-3.0-only

  Contact KDAB at <info@kdab.com> for commercial licensing options.
*/
import 'dart:ffi' as ffi;
import 'package:ffi/ffi.dart';
import '../TypeHelpers.dart';
import '../../Bindings.dart';
import '../../Bindings_KDDWBindingsCore.dart' as KDDWBindingsCore;
import '../../Bindings_KDDWBindingsFlutter.dart' as KDDWBindingsFlutter;
import '../../LibraryLoader.dart';
import '../../FinalizerHelpers.dart';

var _dylib = Library.instance().dylib;

class Platform extends KDDWBindingsCore.Platform {
  Platform.fromCppPointer(var cppPointer, [var needsAutoDelete = false])
      : super.fromCppPointer(cppPointer, needsAutoDelete) {}
  Platform.init() : super.init() {}
  factory Platform.fromCache(var cppPointer, [needsAutoDelete = false]) {
    if (KDDWBindingsCore.Platform.isCached(cppPointer)) {
      var instance =
          KDDWBindingsCore.Platform.s_dartInstanceByCppPtr[cppPointer.address];
      if (instance != null) return instance as Platform;
    }
    return Platform.fromCppPointer(cppPointer, needsAutoDelete);
  } //Platform()
  Platform() : super.init() {
    final voidstar_Func_void func = _dylib
        .lookup<ffi.NativeFunction<voidstar_Func_void_FFI>>(
            'c_KDDockWidgets__flutter__Platform__constructor')
        .asFunction();
    thisCpp = func();
    KDDWBindingsCore.Platform.s_dartInstanceByCppPtr[thisCpp.address] = this;
    registerCallbacks();
  }
  static ffi.Pointer<void> applicationName_calledFromC(
      ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .Platform.s_dartInstanceByCppPtr[thisCpp.address] as Platform;
    if (dartInstance == null) {
      print(
          "Dart instance not found for Platform::applicationName() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.applicationName();
    return result.thisCpp;
  }

  static ffi.Pointer<void> createDefaultViewFactory_calledFromC(
      ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .Platform.s_dartInstanceByCppPtr[thisCpp.address] as Platform;
    if (dartInstance == null) {
      print(
          "Dart instance not found for Platform::createDefaultViewFactory()! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.createDefaultViewFactory();
    return result.thisCpp;
  }

  static ffi.Pointer<void> createMainWindow_calledFromC(
      ffi.Pointer<void> thisCpp,
      ffi.Pointer<void>? uniqueName,
      ffi.Pointer<void> viewOpts,
      int options,
      ffi.Pointer<void>? parent,
      int flags) {
    var dartInstance = KDDWBindingsCore
        .Platform.s_dartInstanceByCppPtr[thisCpp.address] as Platform;
    if (dartInstance == null) {
      print(
          "Dart instance not found for Platform::createMainWindow(const QString & uniqueName, KDDockWidgets::Core::CreateViewOptions viewOpts, QFlags<KDDockWidgets::MainWindowOption> options, KDDockWidgets::Core::View * parent, Qt::WindowFlags flags) const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.createMainWindow(
        QString.fromCppPointer(uniqueName).toDartString(),
        CreateViewOptions.fromCppPointer(viewOpts),
        options: options,
        parent: (parent == null || parent.address == 0)
            ? null
            : KDDWBindingsCore.View.fromCppPointer(parent),
        arg__5: flags);
    return result.thisCpp;
  }

  static ffi.Pointer<void> createView_calledFromC(ffi.Pointer<void> thisCpp,
      ffi.Pointer<void>? controller, ffi.Pointer<void>? parent) {
    var dartInstance = KDDWBindingsCore
        .Platform.s_dartInstanceByCppPtr[thisCpp.address] as Platform;
    if (dartInstance == null) {
      print(
          "Dart instance not found for Platform::createView(KDDockWidgets::Core::Controller * controller, KDDockWidgets::Core::View * parent) const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.createView(
        (controller == null || controller.address == 0)
            ? null
            : KDDWBindingsCore.Controller.fromCppPointer(controller),
        parent: (parent == null || parent.address == 0)
            ? null
            : KDDWBindingsCore.View.fromCppPointer(parent));
    return result.thisCpp;
  }

  static ffi.Pointer<void> cursorPos_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .Platform.s_dartInstanceByCppPtr[thisCpp.address] as Platform;
    if (dartInstance == null) {
      print(
          "Dart instance not found for Platform::cursorPos() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.cursorPos();
    return result.thisCpp;
  }

  static void dumpManagedBacktrace_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .Platform.s_dartInstanceByCppPtr[thisCpp.address] as Platform;
    if (dartInstance == null) {
      print(
          "Dart instance not found for Platform::dumpManagedBacktrace()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.dumpManagedBacktrace();
  }

  static int hasActivePopup_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .Platform.s_dartInstanceByCppPtr[thisCpp.address] as Platform;
    if (dartInstance == null) {
      print(
          "Dart instance not found for Platform::hasActivePopup() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.hasActivePopup();
    return result ? 1 : 0;
  }

  static int inDisallowedDragView_calledFromC(
      ffi.Pointer<void> thisCpp, ffi.Pointer<void> globalPos) {
    var dartInstance = KDDWBindingsCore
        .Platform.s_dartInstanceByCppPtr[thisCpp.address] as Platform;
    if (dartInstance == null) {
      print(
          "Dart instance not found for Platform::inDisallowedDragView(QPoint globalPos) const! (${thisCpp.address})");
      throw Error();
    }
    final result =
        dartInstance.inDisallowedDragView(QPoint.fromCppPointer(globalPos));
    return result ? 1 : 0;
  } // init()

  init() {
    final void_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<void_Func_voidstar_FFI>>(
            'c_KDDockWidgets__flutter__Platform__init')
        .asFunction();
    func(thisCpp);
  }

  static void installMessageHandler_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .Platform.s_dartInstanceByCppPtr[thisCpp.address] as Platform;
    if (dartInstance == null) {
      print(
          "Dart instance not found for Platform::installMessageHandler()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.installMessageHandler();
  }

  static int isLeftMouseButtonPressed_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .Platform.s_dartInstanceByCppPtr[thisCpp.address] as Platform;
    if (dartInstance == null) {
      print(
          "Dart instance not found for Platform::isLeftMouseButtonPressed() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.isLeftMouseButtonPressed();
    return result ? 1 : 0;
  }

  static int isProcessingAppQuitEvent_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .Platform.s_dartInstanceByCppPtr[thisCpp.address] as Platform;
    if (dartInstance == null) {
      print(
          "Dart instance not found for Platform::isProcessingAppQuitEvent() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.isProcessingAppQuitEvent();
    return result ? 1 : 0;
  } // maybeResumeCoRoutines()

  maybeResumeCoRoutines() {
    final void_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<void_Func_voidstar_FFI>>(
            'c_KDDockWidgets__flutter__Platform__maybeResumeCoRoutines')
        .asFunction();
    func(thisCpp);
  }

  static ffi.Pointer<Utf8> name_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .Platform.s_dartInstanceByCppPtr[thisCpp.address] as Platform;
    if (dartInstance == null) {
      print(
          "Dart instance not found for Platform::name() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.name();
    return result.toNativeUtf8();
  }

  static void onFloatingWindowCreated_calledFromC(
      ffi.Pointer<void> thisCpp, ffi.Pointer<void>? arg__1) {
    var dartInstance = KDDWBindingsCore
        .Platform.s_dartInstanceByCppPtr[thisCpp.address] as Platform;
    if (dartInstance == null) {
      print(
          "Dart instance not found for Platform::onFloatingWindowCreated(KDDockWidgets::Core::FloatingWindow * arg__1)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.onFloatingWindowCreated((arg__1 == null || arg__1.address == 0)
        ? null
        : KDDWBindingsCore.FloatingWindow.fromCppPointer(arg__1));
  }

  static void onFloatingWindowDestroyed_calledFromC(
      ffi.Pointer<void> thisCpp, ffi.Pointer<void>? arg__1) {
    var dartInstance = KDDWBindingsCore
        .Platform.s_dartInstanceByCppPtr[thisCpp.address] as Platform;
    if (dartInstance == null) {
      print(
          "Dart instance not found for Platform::onFloatingWindowDestroyed(KDDockWidgets::Core::FloatingWindow * arg__1)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.onFloatingWindowDestroyed(
        (arg__1 == null || arg__1.address == 0)
            ? null
            : KDDWBindingsCore.FloatingWindow.fromCppPointer(arg__1));
  }

  static void onMainWindowCreated_calledFromC(
      ffi.Pointer<void> thisCpp, ffi.Pointer<void>? arg__1) {
    var dartInstance = KDDWBindingsCore
        .Platform.s_dartInstanceByCppPtr[thisCpp.address] as Platform;
    if (dartInstance == null) {
      print(
          "Dart instance not found for Platform::onMainWindowCreated(KDDockWidgets::Core::MainWindow * arg__1)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.onMainWindowCreated((arg__1 == null || arg__1.address == 0)
        ? null
        : KDDWBindingsCore.MainWindow.fromCppPointer(arg__1));
  }

  static void onMainWindowDestroyed_calledFromC(
      ffi.Pointer<void> thisCpp, ffi.Pointer<void>? arg__1) {
    var dartInstance = KDDWBindingsCore
        .Platform.s_dartInstanceByCppPtr[thisCpp.address] as Platform;
    if (dartInstance == null) {
      print(
          "Dart instance not found for Platform::onMainWindowDestroyed(KDDockWidgets::Core::MainWindow * arg__1)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.onMainWindowDestroyed((arg__1 == null || arg__1.address == 0)
        ? null
        : KDDWBindingsCore.MainWindow.fromCppPointer(arg__1));
  }

  static ffi.Pointer<void> organizationName_calledFromC(
      ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .Platform.s_dartInstanceByCppPtr[thisCpp.address] as Platform;
    if (dartInstance == null) {
      print(
          "Dart instance not found for Platform::organizationName() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.organizationName();
    return result.thisCpp;
  } // pauseForDartDebugger()

  pauseForDartDebugger() {
    final void_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<void_Func_voidstar_FFI>>(
            cFunctionSymbolName(779))
        .asFunction();
    func(thisCpp);
  }

  static void pauseForDartDebugger_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .Platform.s_dartInstanceByCppPtr[thisCpp.address] as Platform;
    if (dartInstance == null) {
      print(
          "Dart instance not found for Platform::pauseForDartDebugger()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.pauseForDartDebugger();
  }

  static void pauseForDebugger_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .Platform.s_dartInstanceByCppPtr[thisCpp.address] as Platform;
    if (dartInstance == null) {
      print(
          "Dart instance not found for Platform::pauseForDebugger()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.pauseForDebugger();
  }

  static // platformFlutter()
      KDDWBindingsFlutter.Platform platformFlutter() {
    final voidstar_Func_void func = _dylib
        .lookup<ffi.NativeFunction<voidstar_Func_void_FFI>>(
            'c_static_KDDockWidgets__flutter__Platform__platformFlutter')
        .asFunction();
    ffi.Pointer<void> result = func();
    return KDDWBindingsFlutter.Platform.fromCppPointer(result, false);
  }

  static void restoreMouseCursor_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .Platform.s_dartInstanceByCppPtr[thisCpp.address] as Platform;
    if (dartInstance == null) {
      print(
          "Dart instance not found for Platform::restoreMouseCursor()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.restoreMouseCursor();
  }

  static void runDelayed_calledFromC(
      ffi.Pointer<void> thisCpp, int ms, ffi.Pointer<void>? c) {
    var dartInstance = KDDWBindingsCore
        .Platform.s_dartInstanceByCppPtr[thisCpp.address] as Platform;
    if (dartInstance == null) {
      print(
          "Dart instance not found for Platform::runDelayed(int ms, KDDockWidgets::Core::DelayedCall * c)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.runDelayed(
        ms,
        (c == null || c.address == 0)
            ? null
            : KDDWBindingsCore.DelayedCall.fromCppPointer(c));
  } // runTests()

  runTests() {
    final void_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<void_Func_voidstar_FFI>>(
            'c_KDDockWidgets__flutter__Platform__runTests')
        .asFunction();
    func(thisCpp);
  }

  static int screenNumberFor_calledFromC(
      ffi.Pointer<void> thisCpp, ffi.Pointer<void>? arg__1) {
    var dartInstance = KDDWBindingsCore
        .Platform.s_dartInstanceByCppPtr[thisCpp.address] as Platform;
    if (dartInstance == null) {
      print(
          "Dart instance not found for Platform::screenNumberFor(KDDockWidgets::Core::View * arg__1) const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.screenNumberFor(
        (arg__1 == null || arg__1.address == 0)
            ? null
            : KDDWBindingsCore.View.fromCppPointer(arg__1));
    return result;
  }

  static ffi.Pointer<void> screenSizeFor_calledFromC(
      ffi.Pointer<void> thisCpp, ffi.Pointer<void>? arg__1) {
    var dartInstance = KDDWBindingsCore
        .Platform.s_dartInstanceByCppPtr[thisCpp.address] as Platform;
    if (dartInstance == null) {
      print(
          "Dart instance not found for Platform::screenSizeFor(KDDockWidgets::Core::View * arg__1) const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.screenSizeFor(
        (arg__1 == null || arg__1.address == 0)
            ? null
            : KDDWBindingsCore.View.fromCppPointer(arg__1));
    return result.thisCpp;
  }

  static void sendEvent_calledFromC(ffi.Pointer<void> thisCpp,
      ffi.Pointer<void>? arg__1, ffi.Pointer<void>? arg__2) {
    var dartInstance = KDDWBindingsCore
        .Platform.s_dartInstanceByCppPtr[thisCpp.address] as Platform;
    if (dartInstance == null) {
      print(
          "Dart instance not found for Platform::sendEvent(KDDockWidgets::Core::View * arg__1, KDDockWidgets::Event * arg__2) const! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.sendEvent(
        (arg__1 == null || arg__1.address == 0)
            ? null
            : KDDWBindingsCore.View.fromCppPointer(arg__1),
        (arg__2 == null || arg__2.address == 0)
            ? null
            : Event.fromCppPointer(arg__2));
  }

  static void setCursorPos_calledFromC(
      ffi.Pointer<void> thisCpp, ffi.Pointer<void> arg__1) {
    var dartInstance = KDDWBindingsCore
        .Platform.s_dartInstanceByCppPtr[thisCpp.address] as Platform;
    if (dartInstance == null) {
      print(
          "Dart instance not found for Platform::setCursorPos(QPoint arg__1)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setCursorPos(QPoint.fromCppPointer(arg__1));
  }

  static void setMouseCursor_calledFromC(
      ffi.Pointer<void> thisCpp, int arg__1) {
    var dartInstance = KDDWBindingsCore
        .Platform.s_dartInstanceByCppPtr[thisCpp.address] as Platform;
    if (dartInstance == null) {
      print(
          "Dart instance not found for Platform::setMouseCursor(Qt::CursorShape arg__1)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setMouseCursor(arg__1);
  }

  static int startDragDistance_impl_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .Platform.s_dartInstanceByCppPtr[thisCpp.address] as Platform;
    if (dartInstance == null) {
      print(
          "Dart instance not found for Platform::startDragDistance_impl() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.startDragDistance_impl();
    return result;
  }

  static ffi.Pointer<void> tests_createFocusableView_calledFromC(
      ffi.Pointer<void> thisCpp,
      ffi.Pointer<void> arg__1,
      ffi.Pointer<void>? parent) {
    var dartInstance = KDDWBindingsCore
        .Platform.s_dartInstanceByCppPtr[thisCpp.address] as Platform;
    if (dartInstance == null) {
      print(
          "Dart instance not found for Platform::tests_createFocusableView(KDDockWidgets::Core::CreateViewOptions arg__1, KDDockWidgets::Core::View * parent)! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.tests_createFocusableView(
        CreateViewOptions.fromCppPointer(arg__1),
        parent: (parent == null || parent.address == 0)
            ? null
            : KDDWBindingsCore.View.fromCppPointer(parent));
    return result.thisCpp;
  }

  static ffi.Pointer<void> tests_createNonClosableView_calledFromC(
      ffi.Pointer<void> thisCpp, ffi.Pointer<void>? parent) {
    var dartInstance = KDDWBindingsCore
        .Platform.s_dartInstanceByCppPtr[thisCpp.address] as Platform;
    if (dartInstance == null) {
      print(
          "Dart instance not found for Platform::tests_createNonClosableView(KDDockWidgets::Core::View * parent)! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.tests_createNonClosableView(
        parent: (parent == null || parent.address == 0)
            ? null
            : KDDWBindingsCore.View.fromCppPointer(parent));
    return result.thisCpp;
  }

  static ffi.Pointer<void> tests_createView_calledFromC(
      ffi.Pointer<void> thisCpp,
      ffi.Pointer<void> arg__1,
      ffi.Pointer<void>? parent) {
    var dartInstance = KDDWBindingsCore
        .Platform.s_dartInstanceByCppPtr[thisCpp.address] as Platform;
    if (dartInstance == null) {
      print(
          "Dart instance not found for Platform::tests_createView(KDDockWidgets::Core::CreateViewOptions arg__1, KDDockWidgets::Core::View * parent)! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.tests_createView(
        CreateViewOptions.fromCppPointer(arg__1),
        parent: (parent == null || parent.address == 0)
            ? null
            : KDDWBindingsCore.View.fromCppPointer(parent));
    return result.thisCpp;
  }

  static void tests_deinitPlatform_impl_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .Platform.s_dartInstanceByCppPtr[thisCpp.address] as Platform;
    if (dartInstance == null) {
      print(
          "Dart instance not found for Platform::tests_deinitPlatform_impl()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.tests_deinitPlatform_impl();
  }

  static void tests_doubleClickOn_calledFromC(ffi.Pointer<void> thisCpp,
      ffi.Pointer<void> globalPos, ffi.Pointer<void>? receiver) {
    var dartInstance = KDDWBindingsCore
        .Platform.s_dartInstanceByCppPtr[thisCpp.address] as Platform;
    if (dartInstance == null) {
      print(
          "Dart instance not found for Platform::tests_doubleClickOn(QPoint globalPos, KDDockWidgets::Core::View * receiver)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.tests_doubleClickOn(
        QPoint.fromCppPointer(globalPos),
        (receiver == null || receiver.address == 0)
            ? null
            : KDDWBindingsCore.View.fromCppPointer(receiver));
  }

  static void tests_initPlatform_impl_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .Platform.s_dartInstanceByCppPtr[thisCpp.address] as Platform;
    if (dartInstance == null) {
      print(
          "Dart instance not found for Platform::tests_initPlatform_impl()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.tests_initPlatform_impl();
  }

  static void ungrabMouse_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .Platform.s_dartInstanceByCppPtr[thisCpp.address] as Platform;
    if (dartInstance == null) {
      print(
          "Dart instance not found for Platform::ungrabMouse()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.ungrabMouse();
  }

  static void uninstallMessageHandler_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .Platform.s_dartInstanceByCppPtr[thisCpp.address] as Platform;
    if (dartInstance == null) {
      print(
          "Dart instance not found for Platform::uninstallMessageHandler()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.uninstallMessageHandler();
  }

  static int usesFallbackMouseGrabber_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = KDDWBindingsCore
        .Platform.s_dartInstanceByCppPtr[thisCpp.address] as Platform;
    if (dartInstance == null) {
      print(
          "Dart instance not found for Platform::usesFallbackMouseGrabber() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.usesFallbackMouseGrabber();
    return result ? 1 : 0;
  }

  void release() {
    final void_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<void_Func_voidstar_FFI>>(
            'c_KDDockWidgets__flutter__Platform__destructor')
        .asFunction();
    func(thisCpp);
  }

  String cFunctionSymbolName(int methodId) {
    switch (methodId) {
      case 725:
        return "c_KDDockWidgets__flutter__Platform__applicationName";
      case 726:
        return "c_KDDockWidgets__flutter__Platform__createDefaultViewFactory";
      case 727:
        return "c_KDDockWidgets__flutter__Platform__createMainWindow_QString_CreateViewOptions_MainWindowOptions_View_WindowFlags";
      case 728:
        return "c_KDDockWidgets__flutter__Platform__createView_Controller_View";
      case 729:
        return "c_KDDockWidgets__flutter__Platform__cursorPos";
      case 730:
        return "c_KDDockWidgets__flutter__Platform__dumpManagedBacktrace";
      case 732:
        return "c_KDDockWidgets__flutter__Platform__hasActivePopup";
      case 733:
        return "c_KDDockWidgets__flutter__Platform__inDisallowedDragView_QPoint";
      case 734:
        return "c_KDDockWidgets__flutter__Platform__installMessageHandler";
      case 737:
        return "c_KDDockWidgets__flutter__Platform__isLeftMouseButtonPressed";
      case 738:
        return "c_KDDockWidgets__flutter__Platform__isProcessingAppQuitEvent";
      case 742:
        return "c_KDDockWidgets__flutter__Platform__name";
      case 743:
        return "c_KDDockWidgets__flutter__Platform__onFloatingWindowCreated_FloatingWindow";
      case 744:
        return "c_KDDockWidgets__flutter__Platform__onFloatingWindowDestroyed_FloatingWindow";
      case 745:
        return "c_KDDockWidgets__flutter__Platform__onMainWindowCreated_MainWindow";
      case 746:
        return "c_KDDockWidgets__flutter__Platform__onMainWindowDestroyed_MainWindow";
      case 747:
        return "c_KDDockWidgets__flutter__Platform__organizationName";
      case 779:
        return "c_KDDockWidgets__flutter__Platform__pauseForDartDebugger";
      case 748:
        return "c_KDDockWidgets__flutter__Platform__pauseForDebugger";
      case 749:
        return "c_KDDockWidgets__flutter__Platform__restoreMouseCursor";
      case 750:
        return "c_KDDockWidgets__flutter__Platform__runDelayed_int_DelayedCall";
      case 751:
        return "c_KDDockWidgets__flutter__Platform__screenNumberFor_View";
      case 752:
        return "c_KDDockWidgets__flutter__Platform__screenSizeFor_View";
      case 753:
        return "c_KDDockWidgets__flutter__Platform__sendEvent_View_Event";
      case 754:
        return "c_KDDockWidgets__flutter__Platform__setCursorPos_QPoint";
      case 755:
        return "c_KDDockWidgets__flutter__Platform__setMouseCursor_CursorShape";
      case 757:
        return "c_KDDockWidgets__flutter__Platform__startDragDistance_impl";
      case 758:
        return "c_KDDockWidgets__flutter__Platform__tests_createFocusableView_CreateViewOptions_View";
      case 759:
        return "c_KDDockWidgets__flutter__Platform__tests_createNonClosableView_View";
      case 760:
        return "c_KDDockWidgets__flutter__Platform__tests_createView_CreateViewOptions_View";
      case 762:
        return "c_KDDockWidgets__flutter__Platform__tests_deinitPlatform_impl";
      case 763:
        return "c_KDDockWidgets__flutter__Platform__tests_doubleClickOn_QPoint_View";
      case 765:
        return "c_KDDockWidgets__flutter__Platform__tests_initPlatform_impl";
      case 767:
        return "c_KDDockWidgets__flutter__Platform__ungrabMouse";
      case 768:
        return "c_KDDockWidgets__flutter__Platform__uninstallMessageHandler";
      case 769:
        return "c_KDDockWidgets__flutter__Platform__usesFallbackMouseGrabber";
    }
    return super.cFunctionSymbolName(methodId);
  }

  static String methodNameFromId(int methodId) {
    switch (methodId) {
      case 725:
        return "applicationName";
      case 726:
        return "createDefaultViewFactory";
      case 727:
        return "createMainWindow";
      case 728:
        return "createView";
      case 729:
        return "cursorPos";
      case 730:
        return "dumpManagedBacktrace";
      case 732:
        return "hasActivePopup";
      case 733:
        return "inDisallowedDragView";
      case 734:
        return "installMessageHandler";
      case 737:
        return "isLeftMouseButtonPressed";
      case 738:
        return "isProcessingAppQuitEvent";
      case 742:
        return "name";
      case 743:
        return "onFloatingWindowCreated";
      case 744:
        return "onFloatingWindowDestroyed";
      case 745:
        return "onMainWindowCreated";
      case 746:
        return "onMainWindowDestroyed";
      case 747:
        return "organizationName";
      case 779:
        return "pauseForDartDebugger";
      case 748:
        return "pauseForDebugger";
      case 749:
        return "restoreMouseCursor";
      case 750:
        return "runDelayed";
      case 751:
        return "screenNumberFor";
      case 752:
        return "screenSizeFor";
      case 753:
        return "sendEvent";
      case 754:
        return "setCursorPos";
      case 755:
        return "setMouseCursor";
      case 757:
        return "startDragDistance_impl";
      case 758:
        return "tests_createFocusableView";
      case 759:
        return "tests_createNonClosableView";
      case 760:
        return "tests_createView";
      case 762:
        return "tests_deinitPlatform_impl";
      case 763:
        return "tests_doubleClickOn";
      case 765:
        return "tests_initPlatform_impl";
      case 767:
        return "ungrabMouse";
      case 768:
        return "uninstallMessageHandler";
      case 769:
        return "usesFallbackMouseGrabber";
    }
    throw Error();
  }

  void registerCallbacks() {
    assert(thisCpp != null);
    final RegisterMethodIsReimplementedCallback registerCallback = _dylib
        .lookup<ffi.NativeFunction<RegisterMethodIsReimplementedCallback_FFI>>(
            'c_KDDockWidgets__flutter__Platform__registerVirtualMethodCallback')
        .asFunction();
    final callback725 = ffi.Pointer.fromFunction<voidstar_Func_voidstar_FFI>(
        KDDWBindingsFlutter.Platform.applicationName_calledFromC);
    registerCallback(thisCpp, callback725, 725);
    final callback726 = ffi.Pointer.fromFunction<voidstar_Func_voidstar_FFI>(
        KDDWBindingsFlutter.Platform.createDefaultViewFactory_calledFromC);
    registerCallback(thisCpp, callback726, 726);
    final callback727 = ffi.Pointer.fromFunction<
            voidstar_Func_voidstar_voidstar_voidstar_ffi_Int32_voidstar_ffi_Int32_FFI>(
        KDDWBindingsFlutter.Platform.createMainWindow_calledFromC);
    registerCallback(thisCpp, callback727, 727);
    final callback728 =
        ffi.Pointer.fromFunction<voidstar_Func_voidstar_voidstar_voidstar_FFI>(
            KDDWBindingsFlutter.Platform.createView_calledFromC);
    registerCallback(thisCpp, callback728, 728);
    final callback729 = ffi.Pointer.fromFunction<voidstar_Func_voidstar_FFI>(
        KDDWBindingsFlutter.Platform.cursorPos_calledFromC);
    registerCallback(thisCpp, callback729, 729);
    final callback730 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        KDDWBindingsCore.Platform.dumpManagedBacktrace_calledFromC);
    registerCallback(thisCpp, callback730, 730);
    const callbackExcept732 = 0;
    final callback732 = ffi.Pointer.fromFunction<bool_Func_voidstar_FFI>(
        KDDWBindingsFlutter.Platform.hasActivePopup_calledFromC,
        callbackExcept732);
    registerCallback(thisCpp, callback732, 732);
    const callbackExcept733 = 0;
    final callback733 =
        ffi.Pointer.fromFunction<bool_Func_voidstar_voidstar_FFI>(
            KDDWBindingsFlutter.Platform.inDisallowedDragView_calledFromC,
            callbackExcept733);
    registerCallback(thisCpp, callback733, 733);
    final callback734 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        KDDWBindingsFlutter.Platform.installMessageHandler_calledFromC);
    registerCallback(thisCpp, callback734, 734);
    const callbackExcept737 = 0;
    final callback737 = ffi.Pointer.fromFunction<bool_Func_voidstar_FFI>(
        KDDWBindingsFlutter.Platform.isLeftMouseButtonPressed_calledFromC,
        callbackExcept737);
    registerCallback(thisCpp, callback737, 737);
    const callbackExcept738 = 0;
    final callback738 = ffi.Pointer.fromFunction<bool_Func_voidstar_FFI>(
        KDDWBindingsFlutter.Platform.isProcessingAppQuitEvent_calledFromC,
        callbackExcept738);
    registerCallback(thisCpp, callback738, 738);
    final callback742 = ffi.Pointer.fromFunction<string_Func_voidstar_FFI>(
        KDDWBindingsFlutter.Platform.name_calledFromC);
    registerCallback(thisCpp, callback742, 742);
    final callback743 =
        ffi.Pointer.fromFunction<void_Func_voidstar_voidstar_FFI>(
            KDDWBindingsFlutter.Platform.onFloatingWindowCreated_calledFromC);
    registerCallback(thisCpp, callback743, 743);
    final callback744 =
        ffi.Pointer.fromFunction<void_Func_voidstar_voidstar_FFI>(
            KDDWBindingsFlutter.Platform.onFloatingWindowDestroyed_calledFromC);
    registerCallback(thisCpp, callback744, 744);
    final callback745 =
        ffi.Pointer.fromFunction<void_Func_voidstar_voidstar_FFI>(
            KDDWBindingsFlutter.Platform.onMainWindowCreated_calledFromC);
    registerCallback(thisCpp, callback745, 745);
    final callback746 =
        ffi.Pointer.fromFunction<void_Func_voidstar_voidstar_FFI>(
            KDDWBindingsFlutter.Platform.onMainWindowDestroyed_calledFromC);
    registerCallback(thisCpp, callback746, 746);
    final callback747 = ffi.Pointer.fromFunction<voidstar_Func_voidstar_FFI>(
        KDDWBindingsFlutter.Platform.organizationName_calledFromC);
    registerCallback(thisCpp, callback747, 747);
    final callback779 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        KDDWBindingsFlutter.Platform.pauseForDartDebugger_calledFromC);
    registerCallback(thisCpp, callback779, 779);
    final callback748 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        KDDWBindingsFlutter.Platform.pauseForDebugger_calledFromC);
    registerCallback(thisCpp, callback748, 748);
    final callback749 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        KDDWBindingsFlutter.Platform.restoreMouseCursor_calledFromC);
    registerCallback(thisCpp, callback749, 749);
    final callback750 =
        ffi.Pointer.fromFunction<void_Func_voidstar_ffi_Int32_voidstar_FFI>(
            KDDWBindingsFlutter.Platform.runDelayed_calledFromC);
    registerCallback(thisCpp, callback750, 750);
    const callbackExcept751 = 0;
    final callback751 =
        ffi.Pointer.fromFunction<int_Func_voidstar_voidstar_FFI>(
            KDDWBindingsFlutter.Platform.screenNumberFor_calledFromC,
            callbackExcept751);
    registerCallback(thisCpp, callback751, 751);
    final callback752 =
        ffi.Pointer.fromFunction<voidstar_Func_voidstar_voidstar_FFI>(
            KDDWBindingsFlutter.Platform.screenSizeFor_calledFromC);
    registerCallback(thisCpp, callback752, 752);
    final callback753 =
        ffi.Pointer.fromFunction<void_Func_voidstar_voidstar_voidstar_FFI>(
            KDDWBindingsFlutter.Platform.sendEvent_calledFromC);
    registerCallback(thisCpp, callback753, 753);
    final callback754 =
        ffi.Pointer.fromFunction<void_Func_voidstar_voidstar_FFI>(
            KDDWBindingsFlutter.Platform.setCursorPos_calledFromC);
    registerCallback(thisCpp, callback754, 754);
    final callback755 =
        ffi.Pointer.fromFunction<void_Func_voidstar_ffi_Int32_FFI>(
            KDDWBindingsFlutter.Platform.setMouseCursor_calledFromC);
    registerCallback(thisCpp, callback755, 755);
    const callbackExcept757 = 0;
    final callback757 = ffi.Pointer.fromFunction<int_Func_voidstar_FFI>(
        KDDWBindingsCore.Platform.startDragDistance_impl_calledFromC,
        callbackExcept757);
    registerCallback(thisCpp, callback757, 757);
    final callback758 =
        ffi.Pointer.fromFunction<voidstar_Func_voidstar_voidstar_voidstar_FFI>(
            KDDWBindingsFlutter.Platform.tests_createFocusableView_calledFromC);
    registerCallback(thisCpp, callback758, 758);
    final callback759 = ffi.Pointer.fromFunction<
            voidstar_Func_voidstar_voidstar_FFI>(
        KDDWBindingsFlutter.Platform.tests_createNonClosableView_calledFromC);
    registerCallback(thisCpp, callback759, 759);
    final callback760 =
        ffi.Pointer.fromFunction<voidstar_Func_voidstar_voidstar_voidstar_FFI>(
            KDDWBindingsFlutter.Platform.tests_createView_calledFromC);
    registerCallback(thisCpp, callback760, 760);
    final callback762 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        KDDWBindingsFlutter.Platform.tests_deinitPlatform_impl_calledFromC);
    registerCallback(thisCpp, callback762, 762);
    final callback763 =
        ffi.Pointer.fromFunction<void_Func_voidstar_voidstar_voidstar_FFI>(
            KDDWBindingsCore.Platform.tests_doubleClickOn_calledFromC);
    registerCallback(thisCpp, callback763, 763);
    final callback765 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        KDDWBindingsFlutter.Platform.tests_initPlatform_impl_calledFromC);
    registerCallback(thisCpp, callback765, 765);
    final callback767 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        KDDWBindingsFlutter.Platform.ungrabMouse_calledFromC);
    registerCallback(thisCpp, callback767, 767);
    final callback768 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        KDDWBindingsFlutter.Platform.uninstallMessageHandler_calledFromC);
    registerCallback(thisCpp, callback768, 768);
    const callbackExcept769 = 0;
    final callback769 = ffi.Pointer.fromFunction<bool_Func_voidstar_FFI>(
        KDDWBindingsFlutter.Platform.usesFallbackMouseGrabber_calledFromC,
        callbackExcept769);
    registerCallback(thisCpp, callback769, 769);
  }
}
