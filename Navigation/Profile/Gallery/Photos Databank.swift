//
//  Photos Databank.swift
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

        photo.append(Photo(image: UIImage(named: "galleryPhoto1")!))
        photo.append(Photo(image: UIImage(named: "galleryPhoto2")!))
        photo.append(Photo(image: UIImage(named: "galleryPhoto3")!))

        return photo
    }
}
