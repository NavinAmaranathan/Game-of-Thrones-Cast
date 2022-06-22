//
//  AppDelegate.swift
//  LBGCodingTask
//
//  Created by Navi on 09/06/22.
//

import UIKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        NetworkMonitor.shared.startMonitoring()
        FirebaseApp.configure()
        return true
    }
}
