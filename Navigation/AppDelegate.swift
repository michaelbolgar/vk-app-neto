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

//        let viewController = ViewController1()
        let profileVC = UINavigationController(rootViewController: ProfileViewController())
        let newsVC = UINavigationController(rootViewController: NewsFeedViewController())
//        let navigationVC = UINavigationController (rootViewController: viewController)

        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [
            profileVC,
            newsVC
        ]

        //UITabBar.appearance().tintColor = UIColor.gray
        // задать цвет кнопок в tabBar



        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()

        return true
    }
}

