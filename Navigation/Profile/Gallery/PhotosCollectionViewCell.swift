//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Михаил Болгар on 30.06.2023.
//

import UIKit

final class PhotosCollectionViewCell: UICollectionViewCell {

    lazy var image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.backgroundColor = .systemGray5
        return image
    }()

    override init (frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        image.image = nil
    }

    func customizeCell(photo: PhotoModel) {
        image.image = photo.image
        contentView.addSubview(image)

        NSLayoutConstraint.activate([

            image.topAnchor.constraint(equalTo: contentView.topAnchor),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)

        ])
    }
}
