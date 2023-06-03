//
//  NewsFeedViewController.swift
//  Navigation
//
//  Created by Михаил Болгар on 03.06.2023.
//

import UIKit

class NewsFeedViewController: UIViewController {

    let label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .systemBackground
        self.title = "News"

        self.label.text = "News"
        self.view.addSubview(self.label)
        self.label.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        self.label.textColor = .black

        self.tabBarItem.title = "News"
    }
}
