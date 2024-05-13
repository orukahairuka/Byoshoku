//
//  AppDekegate.swift
//  Byosyoku
//
//  Created by 櫻井絵理香 on 2024/05/13.
//
import UIKit
import Foundation
import FirebaseCore


class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let filePath = "path/to/your/downloaded/secret-key.json"
        guard let options = FirebaseOptions(contentsOfFile: filePath) else {
            fatalError("Invalid Firebase options file")
        }
        FirebaseApp.configure(options: options)

        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }
}
