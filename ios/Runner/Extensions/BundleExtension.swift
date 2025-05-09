//
//  BundleExtension.swift
//  LocalizeNotificationContent
//
//  Created by Yureka on 30/05/20.
//  Copyright © 2020 Yureka. All rights reserved.
//

import Foundation
import UIKit
private var bundleKey: UInt8 = 0

extension Bundle {
    
    static func swizzleLocalization() {
        let orginalSelector = #selector(localizedString(forKey:value:table:))
        guard let orginalMethod = class_getInstanceMethod(self, orginalSelector) else { return }

        let mySelector = #selector(myLocaLizedString(forKey:value:table:))
        guard let myMethod = class_getInstanceMethod(self, mySelector) else { return }

        if class_addMethod(self, orginalSelector, method_getImplementation(myMethod), method_getTypeEncoding(myMethod)) {
            class_replaceMethod(self, mySelector, method_getImplementation(orginalMethod), method_getTypeEncoding(orginalMethod))
        } else {
            method_exchangeImplementations(orginalMethod, myMethod)
        }
    }

    @objc private func myLocaLizedString(forKey key: String,value: String?, table: String?) -> String {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate,
            let bundlePath = Bundle.main.path(forResource: appDelegate.currentLanguage, ofType: "lproj"),
            let bundle = Bundle(path: bundlePath) else {
                return Bundle.main.myLocaLizedString(forKey: key, value: value, table: table)
        }
        return bundle.myLocaLizedString(forKey: key, value: value, table: table)
    }
    
    static func setLanguage(_ language: String) {
            defer {
                object_setClass(Bundle.main, PrivateBundle.self)
            }

            guard let path = Bundle.main.path(forResource: language, ofType: "lproj"),
                  let bundle = Bundle(path: path) else {
                return
            }

            objc_setAssociatedObject(Bundle.main, &bundleKey, bundle, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }

        private class PrivateBundle: Bundle, @unchecked Sendable {
            override func localizedString(forKey key: String, value: String?, table tableName: String?) -> String {
                if let customBundle = objc_getAssociatedObject(self, &bundleKey) as? Bundle {
                    return customBundle.localizedString(forKey: key, value: value, table: tableName)
                } else {
                    return super.localizedString(forKey: key, value: value, table: tableName)
                }
            }
        }
}
