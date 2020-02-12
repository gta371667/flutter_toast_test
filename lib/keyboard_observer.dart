import 'package:flutter/material.dart';
import 'package:mx_toast/toast_manager.dart';

/// 檢測是否開啟鍵盤
/// 請在MaterialApp initState內加入監聽
/// WidgetsBinding.instance.addObserver(KeyboardObserver());
class KeyboardObserver with WidgetsBindingObserver {
  static final String tag = "KeyboardObserver";

  // 鍵盤是否已開啟
  bool isOpen = false;

  @override
  void didChangeAccessibilityFeatures() {
    print("$tag didChangeAccessibilityFeatures");
    super.didChangeAccessibilityFeatures();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print("$tag didChangeAppLifecycleState");
    super.didChangeAppLifecycleState(state);
  }

  @override
  void didChangeLocales(List<Locale> locale) {
    print("$tag didChangeLocales");
    super.didChangeLocales(locale);
  }

  @override
  void didChangeMetrics() {
    print("$tag didChangeMetrics");
    print("我是誰 ${WidgetsBinding.instance.window.physicalSize}");
    print("我是誰222222 ${WidgetsBinding.instance.window.padding.bottom}");

    print("MediaQueryData ${MediaQueryData.fromWindow(WidgetsBinding.instance.window).padding.bottom}");

    isOpen = !isOpen;

    ToastManager.getInstance().keyboardSubject.add(isOpen);

//    EditableTextState()

    var a = WidgetsBinding.instance;
    super.didChangeMetrics();
  }

  @override
  void didChangePlatformBrightness() {
    print("$tag didChangePlatformBrightness");
    super.didChangePlatformBrightness();
  }

  @override
  void didChangeTextScaleFactor() {
    print("$tag didChangeTextScaleFactor");
    super.didChangeTextScaleFactor();
  }

  @override
  void didHaveMemoryPressure() {
    print("$tag didHaveMemoryPressure");
    super.didHaveMemoryPressure();
  }

  @override
  Future<bool> didPopRoute() {
    print("$tag didPopRoute");
    return super.didPopRoute();
  }

  @override
  Future<bool> didPushRoute(String route) {
    print("$tag didPushRoute");
    return super.didPushRoute(route);
  }
}
