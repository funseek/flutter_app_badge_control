import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app_badge_control/flutter_app_badge_control_method_channel.dart';

void main() {
  MethodChannelFlutterAppBadgeControl platform = MethodChannelFlutterAppBadgeControl();
  const MethodChannel channel = MethodChannel('flutter_app_badge_control');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
