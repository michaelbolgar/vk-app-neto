//
//  InfoViewController.swift
//  Navigation
//
//  Created by Михаил Болгар on 04.06.2023.
//

import UIKit

class InfoViewController: UIViewController {

    private lazy var alertButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.alertButton.setTitle("Alert", for: .normal)
        self.view.addSubview(alertButton)
        self.alertButton.frame = CGRect (
            x: 100,
            y: 380,
            width: 200,
            height: 70
        )
        alertButton.backgroundColor = .systemOrange
        alertButton.layer.cornerRadius = 12
        alertButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)

        self.alertButton.setTitleColor(.black, for: .normal)
        self.alertButton.addTarget(self, action: #selector(hundleButtonTap), for: .touchUpInside)
    }

    lazy var alertMessage = UIAlertController(title: "Alert", message: "Are you sure you want to do this?", preferredStyle: .alert)

    lazy var yesButton = UIAlertAction (title: "Yes", style: .default, handler: { (action) -> Void in print ("Yes button tapped")
    })

    lazy var noButton = UIAlertAction (title: "No", style: .default, handler: { (action) -> Void in print ("No button tapped")
    })

    @objc
    func hundleButtonTap() {
        self.present(alertMessage, animated: true, completion: nil)
        alertMessage.addAction(yesButton)
        alertMessage.addAction(noButton)
    }
}
