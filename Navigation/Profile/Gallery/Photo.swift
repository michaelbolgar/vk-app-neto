//
//  Photo.swift
//  Navigation
//
//  Created by Михаил Болгар on 30.06.2023.
//

import UIKit

struct Photo {

    var image: UIImage

    init (image: UIImage) {
        self.image = image
    }

    static func makeNewPhotoObject() -> [Photo] {
        var photo = [Photo]()

        for i in 1...21 {
            photo.append(Photo(image: (UIImage(named: "galleryPhoto\(i)") ?? UIImage(named: "noPhoto")) ?? UIImage()))
        }
        return photo
    }
}
