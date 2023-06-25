//
//  NewsFeedViewController.swift
//  Navigation
//
//  Created by Михаил Болгар on 03.06.2023.
//

import UIKit

class NewsFeedViewController: UIViewController {

    var post = Post(title: "My trips")

    //добавление двух кнопок в стэк вью лучше перенести в замыкание самого стэка
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        stackView.spacing = 10
        return stackView
    }()

    private lazy var newsButton1: UIButton = {
        let newsButton1 = UIButton()
        newsButton1.setTitle("What's new?", for: .normal)
        newsButton1.backgroundColor = .systemCyan
        newsButton1.layer.cornerRadius = 12
        newsButton1.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        newsButton1.setTitleColor(.black, for: .normal)
        newsButton1.addTarget(self, action: #selector(newsButtonAction), for: .touchUpInside)
        return newsButton1
        }()

    private lazy var newsButton2: UIButton = {
        let newsButton2 = UIButton()
        newsButton2.setTitle("Show post", for: .normal)
        newsButton2.backgroundColor = .systemCyan
        newsButton2.layer.cornerRadius = 12
        newsButton2.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        newsButton2.setTitleColor(.black, for: .normal)
        newsButton2.addTarget(self, action: #selector(newsButtonAction), for: .touchUpInside)
        return newsButton2
    }()

    private func newsFeedVCLayout() {
        view.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 250),
            stackView.heightAnchor.constraint(equalToConstant: 150)
        ])

        stackView.addArrangedSubview(newsButton1)
        stackView.addArrangedSubview(newsButton2)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.navigationController?.navigationBar.prefersLargeTitles = true
        newsFeedVCLayout()
    }

    @objc
    private func newsButtonAction() {
        let postVC = PostViewController()
        self.navigationController?.pushViewController(postVC, animated: true)
        postVC.titlePost = post.title
    }
}
