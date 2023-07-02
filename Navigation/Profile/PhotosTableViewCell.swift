//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Михаил Болгар on 30.06.2023.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {

    private let arrowImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .black
        return imageView
    }()

    private let photoGalleryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Photos"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 24)
        return label
    }()

    private lazy var photoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 8
        return stackView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        photoStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
    }

    func createImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 6
        return imageView
    }

    private func setupStack() {
        for i in 1...4 {
            let imageView = createImageView()
            imageView.image = UIImage(named: "galleryPhoto\(i)") ?? UIImage(named: "noPhoto") ?? UIImage()
            photoStackView.addArrangedSubview(imageView)
        }
    }

    func customizeCell(photo: Photo) {

        arrowImage.image = UIImage(systemName: "arrow.right")
        contentView.addSubview(photoGalleryLabel)
        contentView.addSubview(photoStackView)
        contentView.addSubview(arrowImage)
        setupStack()

        let inset: CGFloat = 12
        let insetBetweenPhotos: CGFloat = 8
        let width = (contentView.bounds.width - insetBetweenPhotos * 3 - inset * 2) / 4

        NSLayoutConstraint.activate([

            photoGalleryLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: inset),
            photoGalleryLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),

            arrowImage.centerYAnchor.constraint(equalTo: photoGalleryLabel.centerYAnchor),
            arrowImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
            arrowImage.widthAnchor.constraint(equalToConstant: 30),
            arrowImage.heightAnchor.constraint(equalToConstant: 30),

            photoStackView.topAnchor.constraint(equalTo: photoGalleryLabel.bottomAnchor, constant: inset),
            photoStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            photoStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -inset),
            photoStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
            photoStackView.heightAnchor.constraint(equalToConstant: width)

        ])
    }
}
