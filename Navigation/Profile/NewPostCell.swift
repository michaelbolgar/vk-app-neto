//
//  NewPostCell.swift
//  Navigation
//
//  Created by Михаил Болгар on 30.06.2023.
//

import UIKit

final class NewPostCell: UITableViewCell {

    private let authorName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.numberOfLines = 2
        return label
    }()

    private let postImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .black
        return imageView
    }()

    private let postText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        return label
    }()

    private let likesCount: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 1
        return label
    }()

    private let viewsCount: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 1
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        authorName.text = nil
        postImage.image = nil
        postText.text = nil
        likesCount.text = nil
        viewsCount.text = nil
    }

    func setupCell(post: NewPost) {
        authorName.text = post.author
        postImage.image = post.image
        postText.text = post.description
        likesCount.text = ("Likes: \(post.likesCount)")
        viewsCount.text = ("Views: \(post.viewsCount)")
    }

    private func layout() {
        [authorName, postImage, postText, likesCount, viewsCount].forEach { contentView.addSubview($0) }

        let viewInset: CGFloat = 16
        let screenWidth = UIScreen.main.bounds.width

        NSLayoutConstraint.activate([

            authorName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: viewInset),
            authorName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: viewInset),
            authorName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -viewInset),

            postImage.topAnchor.constraint(equalTo: authorName.bottomAnchor, constant: viewInset),
            postImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            postImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            postImage.widthAnchor.constraint(equalToConstant: screenWidth),
            postImage.heightAnchor.constraint(equalToConstant: screenWidth),

            postText.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: viewInset),
            postText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: viewInset),
            postText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -viewInset),

            likesCount.topAnchor.constraint(equalTo: postText.bottomAnchor, constant: viewInset),
            likesCount.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: viewInset),
            likesCount.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -viewInset),

            viewsCount.topAnchor.constraint(equalTo: postText.bottomAnchor, constant: viewInset),
            viewsCount.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -viewInset),
            viewsCount.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -viewInset),
        ])
    }
}

