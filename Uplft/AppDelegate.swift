//
//  AppDelegate.swift
//  Uplft
//
//  Created by John Larson on 10/5/21.
//
//  Custom AppDelegate class necessary so Firebase can initialize when the app starts.

import Foundation
import UIKit
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions:
    [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

//Thank you to https://www.hackingwithswift.com/quick-start/swiftui/how-to-add-an-appdelegate-to-a-swiftui-app for the help
