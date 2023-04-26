import 'flutter_app_badge_control_platform_interface.dart';

class FlutterAppBadgeControl {
  Future<String?> getPlatformVersion() {
    return FlutterAppBadgeControlPlatform.instance.getPlatformVersion();
  }

  static Future<void> updateBadgeCount(int count) {
    return FlutterAppBadgeControlPlatform.instance.updateBadgeCount(count);
  }

  static Future<void> removeBadge() {
    return FlutterAppBadgeControlPlatform.instance.removeBadge();
  }

  static Future<bool> isAppBadgeSupported() {
    return FlutterAppBadgeControlPlatform.instance.isAppBadgeSupported();
  }
}
