import 'dart:async';

import 'package:flutter/services.dart';

class Raavailability {
  static const MethodChannel _channel = const MethodChannel('raavailability');

  static Future<bool> get isSupported async {
    final bool supported = await _channel.invokeMethod('isSupported');
    return supported;
  }
}
