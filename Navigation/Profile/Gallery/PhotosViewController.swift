//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Михаил Болгар on 30.06.2023.
//

import UIKit

class PhotosViewController: UIViewController, UICollectionViewDelegate {

    private let photo = Photo.makeNewPhotoObject()

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let photosCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        photosCollectionView.translatesAutoresizingMaskIntoConstraints = false
        photosCollectionView.backgroundColor = .white
        photosCollectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifier)
        photosCollectionView.dataSource = self
        photosCollectionView.delegate = self
        return photosCollectionView
    }()

    private lazy var groundView: UIView = {
        let groundView = UIView()
        groundView.translatesAutoresizingMaskIntoConstraints = false
        groundView.backgroundColor = .black
        groundView.alpha = 0
        return groundView
    }()

    private var leadingImageView = NSLayoutConstraint()
    private var topImageView = NSLayoutConstraint()

    override func viewDidLoad() {
        super.viewDidLoad()
        let colorSet = UIColor(rgb: 0x4885CC)

        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.backgroundColor = .systemGray5
        navigationController?.navigationBar.tintColor = colorSet
        navigationItem.title = "Photo Gallery"
        layout()
    }

    private func layout() {
        view.addSubview(collectionView)
        view.backgroundColor = .systemGray5
        view.addSubview(groundView)

        NSLayoutConstraint.activate([

            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

            groundView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            groundView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            groundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            groundView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)

        ])
    }
}

extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photo.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifier, for: indexPath) as? PhotosCollectionViewCell 
        cell?.customizeCell(photo: photo[indexPath.item])
        return cell ?? UICollectionViewCell()
    }
}


extension PhotosViewController: UICollectionViewDelegateFlowLayout {

    private var inset: CGFloat { return 8 }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - inset * 4) / 3
        return CGSize (width: width, height: width)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        inset
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets (top: inset, left: inset, bottom: inset, right: inset)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        inset
    }

//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let expandedCell = PhotosTableViewCell()
//        self.view.addSubview(expandedCell)
//        expandedCell.imageExpandedCell.image = images[indexPath.item]
//        navigationController?.navigationBar.isHidden = true
//        NSLayoutConstraint.activate([
//            expandedCell.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            expandedCell.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            expandedCell.topAnchor.constraint(equalTo: view.topAnchor),
//            expandedCell.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//        ])
//        UIView.animate(withDuration: 0.1, animations: {
//            self.view.layoutIfNeeded()
//        }) { _ in
//            UIView.animate(withDuration: 0.3) {
//                expandedCell.buttonCancel.alpha = 1
//                expandedCell.backgroundColor = .black.withAlphaComponent(0.8)
//            }
//        }
//    }
//}


    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        if let cell = collectionView.cellForItem(at: indexPath) as? PhotosCollectionViewCell {
            collectionView.bringSubviewToFront(cell)
            UIView.animate(withDuration: 0.5) {

                let screenWidth = UIScreen.main.bounds.width
//                let screenHeight = UIScreen.main.bounds.height

                let aspectRatio = cell.image.bounds.width / cell.image.bounds.height
                let newHeight = screenWidth / aspectRatio

                cell.image.transform = CGAffineTransform(scaleX: screenWidth / cell.image.bounds.width, y: newHeight / cell.image.bounds.height)

                self.groundView.backgroundColor = .black.withAlphaComponent(0.5)
                self.groundView.alpha = 0.5
            }
        }
    }
}
