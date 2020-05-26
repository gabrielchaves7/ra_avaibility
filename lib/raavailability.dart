import 'dart:async';

import 'package:flutter/services.dart';

class Raavailability {
  static const MethodChannel _channel = const MethodChannel('raavailability');

  static Future<String> get isSupported async {
    final String supported = await _channel.invokeMethod('isSupported');
    return supported;
  }
}
