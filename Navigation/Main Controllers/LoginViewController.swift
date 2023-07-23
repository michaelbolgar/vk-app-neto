//
//  LoginViewController.swift
//  Navigation
//
//  Created by Михаил Болгар on 26.06.2023.
//

import UIKit

class LoginViewController: UIViewController {

    private let notificationCenter = NotificationCenter.default

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private let contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = Palette.backgroundColor
        return contentView
    }()

    private lazy var logoImage: UIImageView = {
        let logoImage = UIImageView()
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        let logoVKImage = UIImage(named: "logoVKImage")
        logoImage.contentMode = .scaleAspectFit
        logoImage.clipsToBounds = true
        logoImage.image = logoVKImage
        return logoImage
    }()

    private lazy var loginTextField: UITextField = {
        let textField = UITextField()
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.size.height))
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = Palette.textfieldBackgroundColor
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 10
        textField.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        textField.textColor = Palette.textfieldTextColor
        textField.placeholder = "Email or phone"
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.delegate = self
        textField.clearButtonMode = .whileEditing
        return textField
    }()

    private lazy var passwortTextField: UITextField = {
        let textField = UITextField()
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.size.height))
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = Palette.textfieldBackgroundColor
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 10
        textField.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        textField.textColor = Palette.textfieldTextColor
        textField.placeholder = "Passwort"
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.delegate = self
        textField.clearButtonMode = .whileEditing
        textField.isSecureTextEntry = true
        return textField
    }()

    private lazy var loginButton: UIButton = {
        let loginButton = UIButton()
        loginButton.setTitle("Log In", for: .normal)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        loginButton.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        loginButton.layer.cornerRadius = 10
        loginButton.layer.masksToBounds = true
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.addTarget(self, action: #selector(loginButtonAction), for: .touchUpInside)
        return loginButton
    }()

    private lazy var wrongFieldMessage: UILabel = {
        let wrongFieldMessage = UILabel()
        wrongFieldMessage.translatesAutoresizingMaskIntoConstraints = false
        wrongFieldMessage.textColor = .systemRed
        wrongFieldMessage.text = "Password must be at least 6 characters long"
        wrongFieldMessage.font = UIFont.boldSystemFont(ofSize: 12)
        wrongFieldMessage.isHidden = true
        return wrongFieldMessage
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Palette.backgroundColor
        loginViewControllerLayout()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
        notificationCenter.addObserver (self, selector: #selector (keyboardShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(keyboardHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        notificationCenter.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.first != nil {
            view.endEditing(true)
        }
        super .touchesBegan(touches, with: event)
    }

    func configureButtonAppearance(for state: UIControl.State) {
        switch state {
        case .normal:
            loginButton.alpha = 1
        case .highlighted:
            loginButton.alpha = 0.8
        case .selected:
            loginButton.alpha = 0.8
        case .disabled:
            loginButton.alpha = 0.8
        default:
            break
        }
    }

    private func isLoginFieldValid() -> Bool {
        if loginTextField.text?.isEmpty ?? true {
            return false
        }
        return true
    }

    private func isPasswordFieldValid() -> Bool {
        if passwortTextField.text?.isEmpty ?? true {
            return false
        }
        if ((passwortTextField.text?.count ?? -1) < 6) {
            return false
        }
        return true
    }

    private func wrongTextField(_ textField: UITextField) {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.1
        animation.repeatCount = 2
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: textField.center.x - 5, y: textField.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: textField.center.x + 5, y: textField.center.y))
        textField.layer.add(animation, forKey: "position")
    }

    private func loginViewControllerLayout() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        [logoImage, loginTextField, passwortTextField, loginButton, wrongFieldMessage].forEach { contentView.addSubview($0) }

        configureButtonAppearance(for: .normal)
        configureButtonAppearance(for: .highlighted)

        let inset: CGFloat = 16

        NSLayoutConstraint.activate([

            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            logoImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logoImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            logoImage.widthAnchor.constraint(equalToConstant: 100),
            logoImage.heightAnchor.constraint(equalToConstant: 100),

            loginTextField.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 120),
            loginTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            loginTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
            loginTextField.heightAnchor.constraint(equalToConstant: 50),

            passwortTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: -0.5),
            passwortTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            passwortTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
            passwortTextField.heightAnchor.constraint(equalToConstant: 50),

            wrongFieldMessage.topAnchor.constraint(equalTo: passwortTextField.bottomAnchor, constant: 9),
            wrongFieldMessage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),

            loginButton.topAnchor.constraint(equalTo: wrongFieldMessage.bottomAnchor, constant: 9),
            loginButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            loginButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            loginButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -100),
            loginButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    @objc
    private func loginButtonAction() {
        let profileViewController = ProfileViewController()
        if ((passwortTextField.text?.count ?? -1) < 6) {
            wrongFieldMessage.isHidden = false
            wrongTextField(passwortTextField)
        } else {
            wrongFieldMessage.isHidden = true
        }
        if !isPasswordFieldValid() {
            wrongTextField(passwortTextField)
        }
        if !isLoginFieldValid() {
            wrongTextField(loginTextField)
        }
        if loginTextField.text == "1" && passwortTextField.text == "1" {
            self.navigationController?.pushViewController(profileViewController, animated: true)
            view.endEditing(true)
        } else {
            alertMessage()
        }
    }

    @objc
    private func keyboardShow(notification: NSNotification) {
        if let keyboardSize: CGRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = keyboardSize.height + 75
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0,
                                                                    left: 0,
                                                                    bottom: keyboardSize.height,
                                                                    right: 0)
        }
    }

    @objc
    private func keyboardHide() {
        scrollView.contentInset.bottom = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }

    @objc
    func alertMessage() {

        lazy var alertMessage = UIAlertController(title: "Error", message: "Incorrect email and/or passwort", preferredStyle: .alert)

        lazy var okButton = UIAlertAction (title: "Ok", style: .default, handler: { (action) -> Void in print ("Ok button tapped")
        })

        self.present(alertMessage, animated: true, completion: nil)
        alertMessage.addAction(okButton)
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}
