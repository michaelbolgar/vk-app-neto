//
//  Photo.swift
//  Navigation
//
//  Created by Михаил Болгар on 30.06.2023.
//

import UIKit

struct PhotoModel {

    var image: UIImage

    init (image: UIImage) {
        self.image = image
    }

    static func makeNewPhotoObject() -> [PhotoModel] {
        var photo = [PhotoModel]()

        for i in 1...20 {
            photo.append(PhotoModel(image: (UIImage(named: "galleryPhoto\(i)") ?? UIImage(named: "noPhoto")) ?? UIImage()))
        }
        return photo
    }
}
