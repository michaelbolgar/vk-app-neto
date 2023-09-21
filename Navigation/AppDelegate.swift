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

        let profileVC = ProfileViewController()

//        window?.rootViewController = profileVC
        window?.rootViewController = createTabBarController()
        window?.makeKeyAndVisible()
        return true
    }

    func createNewsFeedViewController() -> UINavigationController {
        let newsVC = NewsFeedViewController()
        newsVC.title = "News"
        newsVC.tabBarItem = UITabBarItem (title: "News", image: UIImage(systemName: "newspaper"), tag: 1)
        return UINavigationController(rootViewController: newsVC)
    }

    func createProfileViewController() -> UINavigationController {
        let loginVC = LoginViewController()
        loginVC.tabBarItem = UITabBarItem (title: "Profile", image: UIImage(systemName: "person"), tag: 0)
        return UINavigationController(rootViewController: loginVC)
    }

    func createTabBarController() -> UITabBarController {
        let tabBarController = UITabBarController()
        let colorSet = UIColor(rgb: 0x4885CC)

        tabBarController.tabBar.backgroundColor = colorSet
        tabBarController.viewControllers = [
            createNewsFeedViewController(),
            createProfileViewController()
        ]
        return tabBarController
    }
}

