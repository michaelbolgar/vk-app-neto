//
//  NewsFeedViewController.swift
//  Navigation
//
//  Created by Михаил Болгар on 03.06.2023.
//

import UIKit

class NewsFeedViewController: UIViewController {

    var post = Post(title: "My trips")

    private lazy var newsButton: UIButton = {

        let newsButton = UIButton()
        newsButton.setTitle("What's new?", for: .normal)
        newsButton.frame = CGRect (
            x: 100,
            y: 410,
            width: 200,
            height: 70
        )
        newsButton.backgroundColor = .systemCyan
        newsButton.layer.cornerRadius = 12
        newsButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        newsButton.setTitleColor(.black, for: .normal)
        newsButton.addTarget(self, action: #selector(newsButtonAction), for: .touchUpInside)

        return newsButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .systemBackground
        self.navigationController?.navigationBar.prefersLargeTitles = true

        self.view.addSubview(newsButton)
    }

    @objc
    private func newsButtonAction() {
        let postVC = PostViewController()
        self.navigationController?.pushViewController(postVC, animated: true)
        postVC.titlePost = post.title
    }
}
