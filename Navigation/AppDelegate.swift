//
//  AppDelegate.swift
//  Navigation
//
//  Created by Михаил Болгар on 03.06.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        self.window = UIWindow (frame: UIScreen.main.bounds)

        let profileVC = UINavigationController(rootViewController: ProfileViewController())
        let newsVC = UINavigationController(rootViewController: NewsFeedViewController())

        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [
            profileVC,
            newsVC
        ]

        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()

        return true
    }
}

