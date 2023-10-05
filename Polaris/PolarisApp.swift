//
//  PolarisApp.swift
//  Polaris
//
//  Created by David Roy on 9/22/23.
//

import SwiftUI
import CloudConnectionLayer

class AppDelegate: NSObject, UIApplicationDelegate {

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions:
                        [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        FirebaseHelper.shared.signInAnonymously()
        return true
    }
}

@main
struct PolarisApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ListView()
        }
    }
}
