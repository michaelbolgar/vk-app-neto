//
//  NewsFeedViewController.swift
//  Navigation
//
//  Created by Михаил Болгар on 03.06.2023.
//

import UIKit

class NewsFeedViewController: UIViewController {

    var post = Post(title: "My trip to Spain")

//    let label = UILabel()
    private lazy var newsButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .systemBackground
        self.title = "News"
        self.navigationController?.navigationBar.prefersLargeTitles = true

//        self.label.text = "News"
//        self.view.addSubview(self.label)
//        self.label.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
//        self.label.textColor = .black

        self.tabBarItem = UITabBarItem(title: "News", image: UIImage(systemName: "newspaper"), tag: 0)
        UITabBar.appearance().backgroundColor = .red

        self.newsButton.setTitle("What's new?", for: .normal)
        self.view.addSubview(newsButton)
        self.newsButton.frame = CGRect (
            x: 100,
            y: 410,
            width: 200,
            height: 70
        )
        newsButton.backgroundColor = .systemCyan
        newsButton.layer.cornerRadius = 12
        newsButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)

        self.newsButton.setTitleColor(.black, for: .normal)
        self.newsButton.addTarget(self, action: #selector(hundleButtonTap), for: .touchUpInside)
    }

    @objc
    func hundleButtonTap() {
        let postVC = PostViewController()
        self.navigationController?.pushViewController(postVC, animated: true)
        postVC.titlePost = post.title
    }
}
