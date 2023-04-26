import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app_badge_control/flutter_app_badge_control.dart';
import 'package:flutter_app_badge_control/flutter_app_badge_control_platform_interface.dart';
import 'package:flutter_app_badge_control/flutter_app_badge_control_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterAppBadgeControlPlatform
    with MockPlatformInterfaceMixin
    implements FlutterAppBadgeControlPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<bool> isAppBadgeSupported() {
    return Future.value(true);
  }

  @override
  Future<void> removeBadge() {
    return Future.value(null);
  }

  @override
  Future<void> updateBadgeCount(int count) {
    return Future.value(null);
  }
}

void main() {
  final FlutterAppBadgeControlPlatform initialPlatform =
      FlutterAppBadgeControlPlatform.instance;

  test('$MethodChannelFlutterAppBadgeControl is the default instance', () {
    expect(
        initialPlatform, isInstanceOf<MethodChannelFlutterAppBadgeControl>());
  });

  test('getPlatformVersion', () async {
    FlutterAppBadgeControl flutterAppBadgeControlPlugin =
        FlutterAppBadgeControl();
    MockFlutterAppBadgeControlPlatform fakePlatform =
        MockFlutterAppBadgeControlPlatform();
    FlutterAppBadgeControlPlatform.instance = fakePlatform;

    expect(await flutterAppBadgeControlPlugin.getPlatformVersion(), '42');
  });
}
