//
//  PostDetailViewController.swift
//  Navigation
//
//  Created by Михаил Болгар on 03.07.2023.
//

import UIKit

final class PostDetailViewController: UIViewController {

    var post: NewPost?

    private lazy var authorName: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .systemFont(ofSize: 25)
        return $0
    }(UILabel())

    private lazy var postText: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .systemFont(ofSize: 14)
        return $0
    }(UILabel())

    private lazy var postImage: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
        $0.backgroundColor = .systemGray
        return $0
    }(UIImageView())

    private lazy var likesLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .systemFont(ofSize: 16)
        return $0
    }(UILabel())

    private lazy var viewsLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .systemFont(ofSize: 16)
        return $0
    }(UILabel())

    private lazy var cancelButton: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.tintColor = .systemGray
        $0.setImage(UIImage(systemName: "xmark.app.fill"), for: .normal)
        $0.addTarget(self, action: #selector(closePostAction), for: .touchUpInside)
        return $0
    }(UIButton(type: .system))

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray4
        layout()
    }

    func setupVC(model: NewPost) {
        post = model
        post?.viewsCount += 1
        authorName.text = model.author
        postText.text = model.description
        postImage.image = model.image
        likesLabel.text = "Likes: \(model.likesCount)"
        viewsLabel.text = "Views: \(post?.viewsCount ?? 0)"
        // показ обновлённого количества просмотров с учётом +1 после клика по посту можно было реализовать и короче, записав viewsLabel.text = "Views: \(viewsCount.likesCount + 1)". Тогда можно было бы удалить первые две строки в setupVC и var post в начале
    }

    private func layout() {
        [authorName, postImage, postText, likesLabel, viewsLabel, cancelButton].forEach { view.addSubview($0) }

        let viewInset: CGFloat = 16
        let screenWidth = UIScreen.main.bounds.width

        NSLayoutConstraint.activate([

            postImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            postImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            postImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            postImage.widthAnchor.constraint(equalToConstant: screenWidth),
            postImage.heightAnchor.constraint(equalToConstant: screenWidth),

            authorName.bottomAnchor.constraint(equalTo: postImage.topAnchor, constant: -viewInset),
            authorName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: viewInset),
            authorName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -viewInset),
            authorName.heightAnchor.constraint(equalToConstant: authorName.intrinsicContentSize.height),

            postText.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: viewInset),
            postText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: viewInset),
            postText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -viewInset),
            postText.heightAnchor.constraint(equalToConstant: postText.intrinsicContentSize.height),

            likesLabel.topAnchor.constraint(equalTo: postText.bottomAnchor, constant: viewInset),
            likesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: viewInset),
            likesLabel.heightAnchor.constraint(equalToConstant: likesLabel.intrinsicContentSize.height),

            viewsLabel.topAnchor.constraint(equalTo: postText.bottomAnchor, constant: viewInset),
            viewsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -viewInset),
            viewsLabel.heightAnchor.constraint(equalToConstant: viewsLabel.intrinsicContentSize.height),

            cancelButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: viewInset),
            cancelButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -viewInset)
        ])
    }

    @objc private func closePostAction() {
        print ("close button tapped")
        navigationController?.popViewController(animated: true)
    }
}
