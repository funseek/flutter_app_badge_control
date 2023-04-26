import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_app_badge_control_method_channel.dart';

abstract class FlutterAppBadgeControlPlatform extends PlatformInterface {
  /// Constructs a FlutterAppBadgeControlPlatform.
  FlutterAppBadgeControlPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterAppBadgeControlPlatform _instance =
      MethodChannelFlutterAppBadgeControl();

  /// The default instance of [FlutterAppBadgeControlPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterAppBadgeControl].
  static FlutterAppBadgeControlPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterAppBadgeControlPlatform] when
  /// they register themselves.
  static set instance(FlutterAppBadgeControlPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<void> updateBadgeCount(int count) {
    throw UnimplementedError(
        'updateBadgeCount(int count) has not been implemented.');
  }

  Future<void> removeBadge() {
    throw UnimplementedError('removeBadge() has not been implemented.');
  }

  Future<bool> isAppBadgeSupported() async {
    throw UnimplementedError('isAppBadgeSupported() has not been implemented.');
  }
}
