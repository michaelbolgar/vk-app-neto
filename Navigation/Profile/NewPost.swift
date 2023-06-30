//
//  Post Databank.swift
//  Navigation
//
//  Created by Михаил Болгар on 29.06.2023.
//

import UIKit

struct NewPost {
    let author: String
    let image: UIImage
    let description: String?
    let likesCount: Int
    let viewsCount: Int

    static func makeNewPost() -> [NewPost] {
        var post = [NewPost]()

        post.append(NewPost(author: "Simona",
                            image: { guard let image = UIImage(named: "post1") else { fatalError ("No photo")};
                            return image}(),
                            description: "That milk was good enough",
                            likesCount: 162,
                            viewsCount: 189))

        post.append(NewPost(author: "Simona",
                            image: { guard let image = UIImage(named: "post3") else { fatalError ("No photo")};
                            return image}(),
                            description: "I've got a summer haircut",
                            likesCount: 293,
                            viewsCount: 312))

        post.append(NewPost(author: "Mavrik",
                            image: { guard let image = UIImage(named: "post4") else { fatalError ("No photo")};
                            return image}(),
                            description: "Hi Simona, look how high I got!",
                            likesCount: 333,
                            viewsCount: 350))

        post.append(NewPost(author: "Michael",
                            image: { guard let image = UIImage(named: "post2") else { fatalError ("No photo")};
                            return image}(),
                            description: "Hi Simona, I'm glad that we're roommates now. Hope we'll be good friends",
                            likesCount: 174,
                            viewsCount: 211))

        return post
    }
}
