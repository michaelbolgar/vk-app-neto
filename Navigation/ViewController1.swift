//
//  ViewController1.swift
//  Navigation
//
//  Created by Михаил Болгар on 03.06.2023.
//

import UIKit

class ViewController1: UIViewController {

//    let label = UILabel()

    let pushButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.pushButton.setTitle("Go to the next", for: .normal)
        self.view.addSubview(pushButton)
        self.pushButton.frame = CGRect (
            x: 50,
            y: 100,
            width: 150,
            height: 100
        )
        self.pushButton.setTitleColor(.black, for: .normal)
        self.pushButton.addTarget(self, action: #selector(hundleButtonTap), for: .touchUpInside)
        self.view.backgroundColor = .systemBackground

    }

    @objc
    func hundleButtonTap() {
        let provileVC = ProfileViewController()
        self.navigationController?.pushViewController(provileVC, animated: true)
    }
}
