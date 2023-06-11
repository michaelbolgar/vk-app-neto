//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Михаил Болгар on 03.06.2023.
//

import UIKit

class ProfileViewController: UIViewController {

    private lazy var userName: UILabel = {

        let userName = UILabel()
        userName.frame = CGRect(x: 115, y: 150, width: 200, height: 100)
        userName.text = "Profile of John Smith"
        userName.textColor = .black

        return userName
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.prefersLargeTitles = true

        self.view.addSubview(self.userName)

    }
}
