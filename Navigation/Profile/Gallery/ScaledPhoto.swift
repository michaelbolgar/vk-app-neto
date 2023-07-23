//
//  PhotoDetailViewController.swift
//  Navigation
//
//  Created by Михаил Болгар on 03.07.2023.
//
import UIKit

protocol ScaledPhotoDelegate: AnyObject {
    func pressedButton(view: ScaledPhoto)
}

class ScaledPhoto: UIView {

    weak var delegate: ScaledPhotoDelegate?

    lazy var scaledImage: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFill
        return $0
    }(UIImageView())

    lazy var cancelButton: UIImageView = {
        let button = UIImageView()
        $0.image = UIImage(systemName: "multiply.square")
        $0.tintColor = .white
        $0.alpha = 0
        $0.isUserInteractionEnabled = true
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())

    lazy var groundView: UIView = {
        let groundView = UIView()
        groundView.translatesAutoresizingMaskIntoConstraints = false
        groundView.backgroundColor = .black
        groundView.alpha = 0
        return groundView
    }()

    override init (frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        layout()
        setupGesture()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupGesture() {
        let cancelButtonGesture = UITapGestureRecognizer()
        cancelButtonGesture.addTarget(self, action: #selector(cancelButtonAction))
        cancelButton.addGestureRecognizer(cancelButtonGesture)
    }

    private func layout() {
        self.addSubview(scaledImage)
        self.addSubview(cancelButton)
        self.addSubview(groundView)

        let screenWidth = UIScreen.main.bounds.width

        NSLayoutConstraint.activate([

            groundView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            groundView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            groundView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            groundView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),

            scaledImage.leadingAnchor.constraint(equalTo: groundView.leadingAnchor),
            scaledImage.trailingAnchor.constraint(equalTo: groundView.trailingAnchor),
            scaledImage.centerYAnchor.constraint(equalTo: groundView.centerYAnchor),
            scaledImage.widthAnchor.constraint(equalToConstant: screenWidth),
            scaledImage.heightAnchor.constraint(equalToConstant: screenWidth),

            cancelButton.topAnchor.constraint(equalTo: groundView.topAnchor, constant: 20),
            cancelButton.trailingAnchor.constraint(equalTo: groundView.trailingAnchor, constant: -20)
            //добавить констрейнт на обязательное расстояние кнопки от фотографии, чтобы она не наползала на увеличенное фото, видимо с приоритетом констрейнтов
        ])
    }

    @objc func cancelButtonAction(_ gestureRecognizer: UITapGestureRecognizer) {
        delegate?.pressedButton(view: self)
    }
}
