//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Михаил Болгар on 03.06.2023.
//

import UIKit

class ProfileViewController: UIViewController {

    let label = UILabel()
    let pushButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        self.title = "Profile"

        self.label.text = "AAA"
        self.view.addSubview(self.label)
        self.label.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        self.label.textColor = .black

        self.pushButton.setTitle("Go to the next", for: .normal)
        self.view.addSubview(pushButton)
        self.pushButton.frame = CGRect (
            x: 50,
            y: 150,
            width: 150,
            height: 100
        )
        self.pushButton.setTitleColor(.black, for: .normal)
        self.pushButton.addTarget(self, action: #selector(hundleButtonTap), for: .touchUpInside)

        self.tabBarItem.title = "Profile"
    }

    @objc
    func hundleButtonTap() {
        let newsVC = NewsFeedViewController()
        self.navigationController?.pushViewController(newsVC, animated: true)
    }
}
