//
//  PolarisApp.swift
//  Polaris
//
//  Created by David Roy on 9/22/23.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions:
                        [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        FirebaseApp.configure()
        self.signIn()
        return true
    }

    private func signIn() {
        Auth.auth().signInAnonymously { authResult, error in
            print("AuthResult = \(String(describing: authResult))")
            print("Error = \(String(describing: error))")
        }
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
