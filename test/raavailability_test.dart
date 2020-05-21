import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:raavailability/raavailability.dart';

void main() {
  const MethodChannel channel = MethodChannel('raavailability');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return true;
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('isSupported', () async {
    expect(await Raavailability.isSupported, true);
  });
}
