//
//  ScaledAvatar.swift
//  Navigation
//
//  Created by Михаил Болгар on 09.07.2023.
//

import UIKit

protocol ScaledAvatarDelegate: AnyObject {
    func pressedButton(view: ScaledAvatar)
}

class ScaledAvatar: UIView {

    weak var delegate: ScaledAvatarDelegate?
    private let photoSize: CGFloat = 300

    lazy var scaledAvatar: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = photoSize / 2
        $0.layer.borderColor = UIColor.white.cgColor
        $0.layer.borderWidth = 3
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
        self.addSubview(scaledAvatar)
        self.addSubview(cancelButton)

        NSLayoutConstraint.activate([
            scaledAvatar.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            scaledAvatar.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            scaledAvatar.widthAnchor.constraint(equalToConstant: photoSize),
            scaledAvatar.heightAnchor.constraint(equalToConstant: photoSize),

            cancelButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 30),
            cancelButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -30)
        ])
    }

    @objc func cancelButtonAction(_ gestureRecognizer: UITapGestureRecognizer) {
        delegate?.pressedButton(view: self)
    }
}

