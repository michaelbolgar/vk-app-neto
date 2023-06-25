//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Михаил Болгар on 11.06.2023.
//

import UIKit

class ProfileHeaderView: UIView {

    private let photoSize: CGFloat = 110
    private var portraitLayout = [NSLayoutConstraint]()
    private var landscapeLayout = [NSLayoutConstraint]()
    private var isPortraitOrientation: Bool {
        return bounds.size.width < bounds.size.height
    }

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
        showStatusButton.setTitle("Set status", for: .normal)
        showStatusButton.backgroundColor = .systemBlue
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
        textField.backgroundColor = .white
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 12
        textField.textColor = .black
        textField.clearButtonMode = .whileEditing
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private lazy var lightButton: UIButton = {
        let lightButton = UIButton()
        lightButton.setTitle("Light off", for: .normal)
        lightButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        lightButton.backgroundColor = .systemBlue
        lightButton.setTitleColor(.white, for: .normal)
        lightButton.addTarget(self, action: #selector(lightButtonAction), for: .touchUpInside)
        lightButton.translatesAutoresizingMaskIntoConstraints = false
        return lightButton
    }()

    override init (frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemGray3
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        activateInitialLayoutConstraints()
    }

    //скрыть клавиатуру при нажатии в любом месте экрана
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.first != nil {
            self.endEditing(true)
        }
        super .touchesBegan(touches, with: event)
    }

    private func activateInitialLayoutConstraints() {
            if isPortraitOrientation {
                NSLayoutConstraint.activate(portraitLayout)
            } else {
                NSLayoutConstraint.activate(landscapeLayout)
            }
        }

    private func layout() {
        addSubview(userPhotoImageView)
        addSubview(userName)
        addSubview(statusText)
        addSubview(textField)
        addSubview(showStatusButton)
        addSubview(lightButton)

        //общие констрейнты, которые не будут зависеть от ориентации экрана
        NSLayoutConstraint.activate([
            showStatusButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 15),
            showStatusButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            showStatusButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            showStatusButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            showStatusButton.heightAnchor.constraint(equalToConstant: 50),

            lightButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            lightButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            lightButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        ])

        portraitLayout = [
            userPhotoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            userPhotoImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            userPhotoImageView.heightAnchor.constraint(equalToConstant: photoSize),
            userPhotoImageView.widthAnchor.constraint(equalToConstant: photoSize),

            userName.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            userName.centerXAnchor.constraint(equalTo: centerXAnchor),

            statusText.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 30),
            statusText.leadingAnchor.constraint(equalTo: userName.leadingAnchor, constant: 0),

            textField.topAnchor.constraint(equalTo: statusText.bottomAnchor, constant: 10),
            textField.leadingAnchor.constraint(equalTo: statusText.leadingAnchor, constant: 0),
            textField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            textField.heightAnchor.constraint(equalToConstant: 40),
            //добавить размер лейбла, чтоб не обрезался
            ]

        landscapeLayout = [
            userPhotoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            userPhotoImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 80),
            userPhotoImageView.heightAnchor.constraint(equalToConstant: photoSize),
            userPhotoImageView.widthAnchor.constraint(equalToConstant: photoSize),

            userName.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            userName.leadingAnchor.constraint(equalTo: userPhotoImageView.trailingAnchor, constant: 30),

            statusText.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 30),
            statusText.leadingAnchor.constraint(equalTo: userPhotoImageView.trailingAnchor, constant: 30),

            textField.topAnchor.constraint(equalTo: statusText.bottomAnchor, constant: 10),
            textField.leadingAnchor.constraint(equalTo: userPhotoImageView.trailingAnchor, constant: 30),
            textField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            textField.heightAnchor.constraint(equalToConstant: 40),
        ]
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

    @objc
    private func lightButtonAction() {
        print ("lightButton touched")
        self.backgroundColor = .systemGray
        statusText.textColor = .white
    }
}
