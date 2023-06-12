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
        showStatusButton.setTitle("Show status", for: .normal)
        showStatusButton.frame = CGRect (
            x: 16,
            y: 216,
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
        showStatusButton.addTarget(self, action: #selector(showStatusButtonAction), for: .touchUpInside)
        return showStatusButton
    }()

    override init (frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .systemGray3
        addSubview(userName)
        addSubview(statusText)
        addSubview(showStatusButton)
        addSubview(userPhotoImageView)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        userPhotoImageView.frame = CGRect(x: 16, y: 96, width: 100, height: 100)
        userPhotoImageView.layer.cornerRadius = userPhotoImageView.frame.height/2
        userPhotoImageView.layer.borderColor = UIColor.gray.cgColor
        userPhotoImageView.layer.borderWidth = 3
        userPhotoImageView.contentMode = .scaleAspectFit
        userPhotoImageView.clipsToBounds = true
        userPhotoImageView.image = catImage
    }

    @objc
    private func showStatusButtonAction() {
        print (statusText.text ?? "No status")
    }

//    override func didMoveToSuperview() {
//        super.didMoveToSuperview()
//    }
//    override func didAddSubview(_ subview: UIView) {
//        super.didAddSubview(subview)
//    }
//    override func willRemoveSubview(_ subview: UIView) {
//        super.willRemoveSubview(subview)
//    }
//    override func willMove(toSuperview newSuperview: UIView?) {
//        super.willMove(toSuperview: newSuperview)
//    }
}
