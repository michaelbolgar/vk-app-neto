//
//  Palette.swift
//  Navigation
//
//  Created by Михаил Болгар on 22.07.2023.
//

import UIKit

struct Palette {

//    static var labelColor: UIColor = {
//        if #available(iOS 13, *) {
//            return UIColor (dynamicProvider: { (traitCollection: UITraitCollection) -> UIColor in
//                if traitCollection.userInterfaceStyle == .light {
//                    return UIColor.black
//                } else {
//                    return UIColor.systemGray3
//                }
//            })
//        } else {
//            return UIColor.systemGray
//        }
//    }()

    static var placeholderColor: UIColor = {
        if #available(iOS 13, *) {
            return UIColor (dynamicProvider: { (traitCollection: UITraitCollection) -> UIColor in
                if traitCollection.userInterfaceStyle == .light {
                    return UIColor.systemGray
                } else {
                    return UIColor (red: 0, green: 0, blue: 0, alpha: 0.5)
                }
            })
        } else {
            return UIColor.black
        }
    }()

    static var textfieldBackgroundColor: UIColor = {
        if #available(iOS 13, *) {
            return UIColor (dynamicProvider: { (traitCollection: UITraitCollection) -> UIColor in
                if traitCollection.userInterfaceStyle == .light {
                    return UIColor.systemGray6
                } else {
                    return UIColor (rgb: 0x252525)
                }
            })
        } else {
            return UIColor.systemGray
        }
    }()

    static var textfieldTextColor: UIColor = {
        if #available(iOS 13, *) {
            return UIColor (dynamicProvider: { (traitCollection: UITraitCollection) -> UIColor in
                if traitCollection.userInterfaceStyle == .light {
                    return UIColor.black
                } else {
                    return UIColor.lightGray
                }
            })
        } else {
            return UIColor.systemGray
        }
    }()

    static var backgroundColor: UIColor = {
        if #available(iOS 13, *) {
            return UIColor (dynamicProvider: { (traitCollection: UITraitCollection) -> UIColor in
                if traitCollection.userInterfaceStyle == .light {
                    return UIColor.white
                } else {
                    return UIColor.systemGray6
                }
            })
        } else {
            return UIColor.black
        }
    }()
}


