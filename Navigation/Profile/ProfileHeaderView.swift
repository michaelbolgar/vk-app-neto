//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Михаил Болгар on 11.06.2023.
//

import UIKit

class ProfileHeaderView: UIView {

    private lazy var catImage = UIImage(named: "userPhoto")
    private lazy var userPhotoImageView: UIImageView = UIImageView()
    private var statusText1: String?
    let userDefaults = UserDefaults.standard

    private lazy var userName: UILabel = {
        let userName = UILabel()
        userName.frame = CGRect(x: 143, y: 75, width: 200, height: 100)
        userName.text = "Lady Simona"
        userName.textColor = .black
        userName.font = UIFont.boldSystemFont(ofSize: 18)
        return userName
    }()

    private lazy var statusText: UILabel = {
        let statusText = UILabel()
        statusText.frame = CGRect(x: 143, y: 120, width: 200, height: 100)
        statusText.text = "Waiting for something..."
        statusText.textColor = .gray
        statusText.font = UIFont.systemFont(ofSize: 14)
        return statusText
    }()

    private lazy var showStatusButton: UIButton = {
        let showStatusButton = UIButton()
        showStatusButton.setTitle("Set status", for: .normal)
        showStatusButton.frame = CGRect (
            x: 16,
            y: 240,
            width: 358,
            height: 50
        )
        showStatusButton.backgroundColor = .systemBlue
        showStatusButton.layer.cornerRadius = 4
        showStatusButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        showStatusButton.setTitleColor(.white, for: .normal)
        showStatusButton.layer.shadowColor = UIColor.black.cgColor
        showStatusButton.layer.shadowOffset = CGSize (width: 4, height: 4)
        showStatusButton.layer.shadowRadius = 4
        showStatusButton.layer.shadowOpacity = 0.7
        showStatusButton.addTarget(self, action: #selector(setStatusButtonAction), for: .touchUpInside)
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
        textField.frame = CGRect (
            x: 143,
            y: 185,
            width: 200,
            height: 40)
        textField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        return textField
    }()

    override init (frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .systemGray3
        addSubview(userName)
        addSubview(statusText)
        addSubview(showStatusButton)
        addSubview(userPhotoImageView)
        addSubview(textField)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        userPhotoImageView.frame = CGRect(x: 16, y: 106, width: 110, height: 110)
        userPhotoImageView.layer.cornerRadius = userPhotoImageView.frame.height/2
        userPhotoImageView.layer.borderColor = UIColor.white.cgColor
        userPhotoImageView.layer.borderWidth = 3
        userPhotoImageView.contentMode = .scaleAspectFit
        userPhotoImageView.clipsToBounds = true
        userPhotoImageView.image = catImage

        statusText.text = UserDefaults.standard.string(forKey: "textUpdated") ?? "Waiting"
        NotificationCenter.default.addObserver(self, selector: #selector(userDefaultsDidChange(_ :)), name: UserDefaults.didChangeNotification, object: nil)
    }

    @objc private func userDefaultsDidChange(_ notification: Notification) {
        if let newValue = UserDefaults.standard.string(forKey: "textUpdated") {
            statusText.text = newValue
        }
    }

    @objc
    private func setStatusButtonAction() {
        if let text = textField.text {
            print(text)
        }

        userDefaults.set(String(textField.text ?? "Waiting for something..."), forKey: "textUpdated")
                let textAtPoint = userDefaults.string(forKey: "textUpdated")
    }

    @objc
    private func statusTextChanged(_ textField: UITextField) {
        statusText1 = textField.text
    }
}
