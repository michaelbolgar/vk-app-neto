//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Михаил Болгар on 03.06.2023.
//

import UIKit

class ProfileViewController: UIViewController {

    let userName = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        self.title = "Profile"
        self.navigationController?.navigationBar.prefersLargeTitles = true

        self.userName.text = "Profile of John Smith"
        self.view.addSubview(self.userName)
        self.userName.frame = CGRect(x: 115, y: 150, width: 200, height: 100)
        self.userName.textColor = .black

        self.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person"), tag: 0)
        UITabBar.appearance().backgroundColor = .red

    }
}
