import UIKit
import SnapKit

class ProfileHeaderView: UIView {

    private let photoSize: CGFloat = 110

    lazy var userPhotoImageView: UIImageView = {
        let userPhotoImageView = UIImageView()
        let catImage = UIImage(named: "userPhoto")
        
        userPhotoImageView.layer.cornerRadius = photoSize / 2
        userPhotoImageView.layer.borderColor = UIColor.white.cgColor
        userPhotoImageView.layer.borderWidth = 3
        userPhotoImageView.contentMode = .scaleAspectFit
        userPhotoImageView.clipsToBounds = true
        userPhotoImageView.image = catImage
        return userPhotoImageView
    }()

    private lazy var userName: UILabel = {
        let userName = UILabel()
        userName.text = "Lady Simona"
        userName.textColor = UIColor.label
        userName.font = UIFont.boldSystemFont(ofSize: 18)
        return userName
    }()

    private lazy var statusText: UILabel = {
        let statusText = UILabel()
        statusText.text = "Waiting for something..."
        statusText.textColor = UIColor.secondaryLabel
        statusText.font = UIFont.systemFont(ofSize: 14)
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
        return showStatusButton
    }()

    private lazy var statusTextField: UITextField = {
        let textField = UITextField()
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.size.height))
        textField.backgroundColor = .white
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 12
        textField.textColor = .black
        textField.clearButtonMode = .whileEditing
        textField.attributedPlaceholder = NSAttributedString (string: "Set your status...", attributes: [NSAttributedString.Key.foregroundColor: Palette.placeholderColor])
        textField.leftView = paddingView
        textField.leftViewMode = .always
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

    private func wrongStatusField(_ textField: UITextField) {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.1
        animation.repeatCount = 2
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: textField.center.x - 5, y: textField.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: textField.center.x + 5, y: textField.center.y))
        textField.layer.add(animation, forKey: "position")
    }

    private func layout() {
        [userPhotoImageView, userName, statusText, statusTextField, showStatusButton].forEach { addSubview($0) }

        let screenWidth = UIScreen.main.bounds.width
        let inset: CGFloat = 16
        let safeAreaInset = self.safeAreaLayoutGuide

        userPhotoImageView.snp.makeConstraints {
            $0.top.equalTo(safeAreaInset).offset(inset)
            $0.leading.equalTo(safeAreaInset).offset(inset)
            $0.size.equalTo(photoSize)
        }

        userName.snp.makeConstraints {
            $0.top.equalTo(userPhotoImageView).offset(5)
            $0.centerX.equalToSuperview()
        }

        statusText.snp.makeConstraints {
            $0.top.equalTo(userName).offset(inset * 2)
            $0.leading.equalTo(userName)
        }

        statusTextField.snp.makeConstraints {
            $0.top.equalTo(statusText).inset(inset * 2)
            $0.leading.equalTo(statusText)
            $0.trailing.equalTo(safeAreaInset).offset(-inset)
            $0.height.equalTo(40)
        }

        showStatusButton.snp.makeConstraints {
            $0.top.equalTo(statusTextField).offset(50)
            $0.leading.equalTo(safeAreaInset).offset(inset)
            $0.trailing.equalTo(safeAreaInset).inset(inset)
            $0.height.equalTo(50)
        }

        self.snp.makeConstraints {
            $0.width.equalTo(screenWidth)
            $0.bottom.equalTo(showStatusButton).offset(inset)
        }
    }

    @objc
    private func setStatusButtonAction() {
        if let text = statusTextField.text, !text.isEmpty {
            print(text)
            statusText.text = text
            statusTextField.text = ""
            self.endEditing(true)
        } else {
            wrongStatusField(statusTextField)
        }
    }
}
