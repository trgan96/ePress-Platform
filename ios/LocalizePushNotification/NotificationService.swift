//
//  NotificationService.swift
//  LocalizePushNotification
//
//  Created by An Nguyen  on 22/4/25.
//

import UserNotifications

class NotificationService: UNNotificationServiceExtension {

    var contentHandler: ((UNNotificationContent) -> Void)?
    var bestAttemptContent: UNMutableNotificationContent?

    override func didReceive(_ request: UNNotificationRequest, withContentHandler contentHandler: @escaping (UNNotificationContent) -> Void) {
        self.contentHandler = contentHandler
        bestAttemptContent = (request.content.mutableCopy() as? UNMutableNotificationContent)
        
        if let bestAttemptContent = bestAttemptContent {
            bestAttemptContent.title = localized(value: bestAttemptContent.title, type: "title")
            bestAttemptContent.body = localized(value: bestAttemptContent.body, type: "body")
            contentHandler(bestAttemptContent)
        }
    }
    
    override func serviceExtensionTimeWillExpire() {
        // Called just before the extension will be terminated by the system.
        // Use this as an opportunity to deliver your "best attempt" at modified content, otherwise the original push payload will be used.
        if let contentHandler = contentHandler, let bestAttemptContent =  bestAttemptContent {
            contentHandler(bestAttemptContent)
        }
    }

    private var appLanguage: String {
        if let userDefault = UserDefaults(suiteName: "group.app.localized") {
            if let currentLang = userDefault.string(forKey: LanguageManagerKeys.selectedLanguage) {
                return currentLang
            }
            return Language.en.rawValue
        } else {
            return Language.en.rawValue
        }
    }
    
    private var appLocale: Locale {
        Locale(identifier: appLanguage)
    }
    
    private func localized(value: String, type: String = "") -> String {
        guard let bundle = Bundle.main.path(forResource: appLanguage, ofType: "lproj") else {
            return NSLocalizedString(value, comment: type)
        }
        if type == "title" {
            let langBundle = Bundle(path: bundle)
            return NSLocalizedString(value, tableName: nil, bundle: langBundle!, comment: type)
        } else {
            //type = "body"
            let keys: [Substring] = value.split(separator: "-")
            guard let key = keys.first else {
                return ""
            }
            
            guard let args2 = keys.last else {
                return ""
            }
            let args1 = keys[1]
            if key.isEmpty || args1.isEmpty || args2.isEmpty {
                return ""
            }
            let langBundle = Bundle(path: bundle)
            let body = NSLocalizedString(String(key).lowercased(), tableName: nil, bundle: langBundle!, comment: type)
            return String(format: body, String(args1), String(args2))
        }
    }
    
}
