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
        window?.rootViewController = createTabBarController()
        window?.makeKeyAndVisible()

        return true
    }

    func createProfileViewController() -> UINavigationController {

        let profileVC = ProfileViewController()

        profileVC.title = "Profile"
        profileVC.tabBarItem = UITabBarItem (title: "Profile", image: UIImage(systemName: "person"), tag: 0)

        return UINavigationController(rootViewController: profileVC)
    }

    func createNewsFeedViewController() -> UINavigationController {

        let newsVC = NewsFeedViewController()

        newsVC.title = "News"
        newsVC.tabBarItem = UITabBarItem (title: "News", image: UIImage(systemName: "newspaper"), tag: 1)

        return UINavigationController(rootViewController: newsVC)
    }

    func createTabBarController() -> UITabBarController {

        let tabBarController = UITabBarController()
        tabBarController.tabBar.backgroundColor = .systemTeal

        tabBarController.viewControllers = [
            createProfileViewController(),
            createNewsFeedViewController()
        ]

        return tabBarController
    }
}

