//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Михаил Болгар on 11.06.2023.
//

import UIKit

class ProfileHeaderView: UIView {

    private let photoSize: CGFloat = 110

    private lazy var userPhotoImageView: UIImageView = {
        let userPhotoImageView = UIImageView()
        let catImage = UIImage(named: "userPhoto")
        userPhotoImageView.layer.cornerRadius = photoSize / 2
        userPhotoImageView.layer.borderColor = UIColor.white.cgColor
        userPhotoImageView.layer.borderWidth = 3
        userPhotoImageView.contentMode = .scaleAspectFit
        userPhotoImageView.clipsToBounds = true
        userPhotoImageView.image = catImage
        userPhotoImageView.translatesAutoresizingMaskIntoConstraints = false
        return userPhotoImageView
    }()

    private lazy var userName: UILabel = {
        let userName = UILabel()
        userName.text = "Lady Simona"
        userName.textColor = .black
        userName.font = UIFont.boldSystemFont(ofSize: 18)
        userName.translatesAutoresizingMaskIntoConstraints = false
        return userName
    }()

    private lazy var statusText: UILabel = {
        let statusText = UILabel()
        statusText.text = "Waiting for something..."
        statusText.textColor = .gray
        statusText.font = UIFont.systemFont(ofSize: 14)
        statusText.translatesAutoresizingMaskIntoConstraints = false
        return statusText
    }()

    private lazy var showStatusButton: UIButton = {
        let showStatusButton = UIButton()
        let colorSet = UIColor(rgb: 0x4885CC)
        showStatusButton.setTitle("Set status", for: .normal)
        showStatusButton.backgroundColor = colorSet
        showStatusButton.layer.cornerRadius = 4
        showStatusButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        showStatusButton.setTitleColor(.white, for: .normal)
        showStatusButton.layer.shadowColor = UIColor.black.cgColor
        showStatusButton.layer.shadowOffset = CGSize (width: 4, height: 4)
        showStatusButton.layer.shadowRadius = 4
        showStatusButton.layer.shadowOpacity = 0.7
        showStatusButton.addTarget(self, action: #selector(setStatusButtonAction), for: .touchUpInside)
        showStatusButton.translatesAutoresizingMaskIntoConstraints = false
        return showStatusButton
    }()

    private lazy var textField: UITextField = {
        let textField = UITextField()
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.size.height))
        textField.backgroundColor = .white
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 12
        textField.textColor = .black
        textField.clearButtonMode = .whileEditing
        textField.placeholder = "Set your status..."
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    override init (frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemGray5
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

//    скрыть клавиатуру при нажатии в любом месте экрана
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.first != nil {
            self.endEditing(true)
        }
        super .touchesBegan(touches, with: event)
    }

    private func layout() {
        [userPhotoImageView, userName, statusText, textField, showStatusButton].forEach { addSubview($0) }

        let screenWidth = UIScreen.main.bounds.width
        let inset: CGFloat = 16
        let safeAreaInset = self.safeAreaLayoutGuide

        NSLayoutConstraint.activate([

            self.widthAnchor.constraint(equalToConstant: screenWidth),
            self.bottomAnchor.constraint(equalTo: showStatusButton.bottomAnchor, constant: inset),

            showStatusButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: inset),
            showStatusButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            showStatusButton.leadingAnchor.constraint(equalTo: safeAreaInset.leadingAnchor, constant: inset),
            showStatusButton.trailingAnchor.constraint(equalTo: safeAreaInset.trailingAnchor, constant: -inset),
            showStatusButton.heightAnchor.constraint(equalToConstant: 50),

            userPhotoImageView.topAnchor.constraint(equalTo: safeAreaInset.topAnchor, constant: inset),
            userPhotoImageView.leadingAnchor.constraint(equalTo: safeAreaInset.leadingAnchor, constant: inset),
            userPhotoImageView.heightAnchor.constraint(equalToConstant: photoSize),
            userPhotoImageView.widthAnchor.constraint(equalToConstant: photoSize),

            userName.topAnchor.constraint(equalTo: safeAreaInset.topAnchor, constant: 27),
            userName.centerXAnchor.constraint(equalTo: centerXAnchor),

            statusText.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 30),
            statusText.leadingAnchor.constraint(equalTo: userName.leadingAnchor, constant: 0),

            textField.topAnchor.constraint(equalTo: statusText.bottomAnchor, constant: 10),
            textField.leadingAnchor.constraint(equalTo: statusText.leadingAnchor, constant: 0),
            textField.trailingAnchor.constraint(equalTo: safeAreaInset.trailingAnchor, constant: -inset),
            textField.heightAnchor.constraint(equalToConstant: 40),

        ])
    }

    @objc
    private func setStatusButtonAction() {
        if let text = textField.text {
            print(text)
            statusText.text = text
            textField.text = ""
        }
        self.endEditing(true)
    }
}
