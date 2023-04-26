import Flutter
import UIKit

public class FlutterAppBadgeControlPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_app_badge_control", binaryMessenger: registrar.messenger())
    let instance = FlutterAppBadgeControlPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("iOS " + UIDevice.current.systemVersion)
    case "updateBadgeCount":
      if let count = call.arguments as? Int {
        updateBadgeCount(count: count)
        result(nil)
      } else {
        result(FlutterError(code: "INVALID_ARGUMENT", message: "Invalid count value", details: nil))
      }
    case "removeBadge":
      updateBadgeCount(count: 0)
      result(nil)
    case "isAppBadgeSupported":
      result(true)
    default:
      result(FlutterMethodNotImplemented)
    }
  }

  private func updateBadgeCount(count: Int) {
    DispatchQueue.main.async {
        UIApplication.shared.applicationIconBadgeNumber = count
    }
  }
}
