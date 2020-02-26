import UIKit
import Flutter
import GoogleMaps // Add this line!

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    GMSServices.provideAPIKey("AIzaSyDw8T0qUkvdnQi8ZFiWB6-04_xj8rmKP7s")  // Add this line!
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}