//
//  PostViewController.swift
//  Navigation
//
//  Created by Михаил Болгар on 04.06.2023.
//

import UIKit

class PostViewController: UIViewController {

    var titlePost: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = titlePost
        self.view.backgroundColor = .systemGray4
        
    }
}
