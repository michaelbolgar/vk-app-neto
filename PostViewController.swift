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
        barAddButton()
    }

    @objc
    private func barAddButton() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem:
            .add,
            target: self,
            action: #selector(showInfoVC)
            )
    }

    @objc
    private func showInfoVC() {
        let infoVC = InfoViewController()
        self.present(infoVC, animated: true)
        infoVC.view.backgroundColor = .systemGray
    }
}
