//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Михаил Болгар on 30.06.2023.
//

import UIKit

final class PhotosCollectionViewCell: UICollectionViewCell {

    var photo: Photo?

    override init (frame: CGRect) {
        super.init(frame: frame)
        customizeCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func customizeCell() {
        contentView.backgroundColor = .systemIndigo
    }
}
