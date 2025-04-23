import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
    var currentLanguage = Language.en.rawValue
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      if #available(iOS 10.0, *) {
          // For iOS 10 display notification (sent via APNS)
          UNUserNotificationCenter.current().delegate = self
          
          let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
          UNUserNotificationCenter.current().requestAuthorization(
              options: authOptions,
              completionHandler: {_, _ in })
      } else {
          let settings: UIUserNotificationSettings =
              UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
          application.registerUserNotificationSettings(settings)
      }
      
      application.registerForRemoteNotifications()
      
      let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
      let configChannel = FlutterMethodChannel(name: "config_channel",
                                                binaryMessenger: controller.binaryMessenger)
      configChannel.setMethodCallHandler({
        [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in
          guard call.method == "setLocale" else {
              result(FlutterMethodNotImplemented)
              return
            }
          debugPrint("setLocale")
          if let args = call.arguments as? [String: Any] {
              let language = args["language"] as? String
              debugPrint("language = \(language)")
              self?.forceChangeLanguage(to: (language == "vi") ? Language.vi : Language.en)
              debugPrint("delegatesetLocale language = \(LanguageManager.shared.currentLanguage)")

        }
          
      })
      
      debugPrint("delegate currentLanguage = \(currentLanguage)")
      debugPrint("delegate LanguageManager currentLanguage = \(LanguageManager.shared.currentLanguage)")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
    override func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let deviceTokenString = deviceToken.hexString
        debugPrint("Register For deviceToken: \(deviceTokenString)")
    }
    override func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        debugPrint("Register For Remote Notification Failed")
    }
    public func forceChangeLanguage(to selectedLanguage: Language) {

        let langaugeManager = LanguageManager.shared

        if langaugeManager.currentLanguage.rawValue != selectedLanguage.rawValue {
            langaugeManager.removeDefaultLanguage()
            langaugeManager.defaultLanguage = selectedLanguage
            langaugeManager.setCurrentLanguage(language: selectedLanguage)
        }
    }
}

extension Data {
   var hexString: String {
       let hexString = map { String(format: "%02.2hhx", $0) }.joined()
       return hexString
   }
}
