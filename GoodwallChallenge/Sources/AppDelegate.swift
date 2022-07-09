//
//  AppDelegate.swift
//  GoodwallChallenge
//
//  Created by emile on 15/03/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate, WindowInjected, AppCoordinatorInjected {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window.rootViewController = appCoordinator.start()
        window.makeKeyAndVisible()
        return true
    }
}
