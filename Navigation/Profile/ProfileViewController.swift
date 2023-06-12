//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Михаил Болгар on 03.06.2023.
//

import UIKit

class ProfileViewController: UIViewController {

    private lazy var profileHeaderView = ProfileHeaderView()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .lightGray
        self.view.addSubview(self.profileHeaderView)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        profileHeaderView.frame = CGRect (x: 0, y: 0, width: Int(view.frame.width), height: Int(view.frame.height))
    }
}
