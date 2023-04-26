# Flutter App Badge Control

`flutter_app_badge_control` is a Flutter plugin for managing app icon badges. It allows you to update or remove the badge count on both iOS and Android devices.

## Overview

This plugin provides an easy way to control the badge count of your app's icon. It is compatible with both iOS and Android platforms. You can update the badge count, remove the badge, or check if badge support is available on the device.

This plugin is inspired by and based on the [flutter_app_badger](https://github.com/g123k/flutter_app_badger) plugin.

## Getting Started

### iOS

In order to use this plugin on iOS, you need to request permission for notifications.
For more information about requesting notification permissions, please refer to the [Apple Developer Documentation](https://developer.apple.com/documentation/usernotifications/asking_permission_to_use_notifications).

### Android

On Android, the plugin uses notification channels to manage app icon badges, as there is no official support for badge count updates. Calling `removeBadge()` will cancel all notifications, effectively removing the badge. Note that calling `updateBadgeCount()` on Android will not have any effect.

For more information about notification channels on Android, please visit the [Android Developer Documentation](https://developer.android.com/develop/ui/views/notifications/channels).

## Usage

To use the plugin, add the following import to your Dart file:

```dart
import 'package:flutter_app_badge_control/flutter_app_badge_control.dart';
```

### Check if App Badge is Supported

```dart
FlutterAppBadgeControl.isAppBadgeSupported().then((value) {
  AppLog.d("isAppBadgeSupported: $value");
});
```

### Remove Badge

```dart
FlutterAppBadgeControl.removeBadge();
```

### Update Badge Count

```dart
FlutterAppBadgeControl.updateBadgeCount(1);
```

**Note:** This method will not have any effect on Android devices.

