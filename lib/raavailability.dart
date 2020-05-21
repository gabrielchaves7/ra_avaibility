import 'dart:async';

import 'package:flutter/services.dart';

class Raavailability {
  static const MethodChannel _channel =
      const MethodChannel('raavailability');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
