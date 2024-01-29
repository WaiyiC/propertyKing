//
//  propertyKingApp.swift
//  propertyKing
//
//  Created by Waiyi on 10/1/2024.
//

import SwiftUI
import FirebaseCore

@main
struct propertyKingApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            Login(showSignInView: .constant(false))
                .environmentObject(DataManager())
        }
    }
}
class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}
