import 'dart:async';

import 'package:flutter/services.dart';

class MxToast {
  static const MethodChannel _channel =
      const MethodChannel('mx_toast');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
