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
    var likesCount: Int
    var viewsCount: Int

    static func makeNewPost() -> [NewPost] {
        var post = [NewPost]()

        post.append(NewPost(author: "Simona",
                            image: UIImage(named: "post1") ?? UIImage(),
                            description: "That milk was good enough",
                            likesCount: 162,
                            viewsCount: 189))

        post.append(NewPost(author: "Simona",
                            image: UIImage(named: "post3") ?? UIImage(),
                            description: "I've got a summer haircut",
                            likesCount: 293,
                            viewsCount: 312))

        post.append(NewPost(author: "Mavrik",
                            image: UIImage(named: "post4") ?? UIImage(),
                            description: "Hi Simona, look how high I got!",
                            likesCount: 333,
                            viewsCount: 350))

        post.append(NewPost(author: "Michael",
                            image: UIImage(named: "post2") ?? UIImage(),
                            description: "Hi Simona, I'm glad that we're roommates now. Hope we'll be good friends",
                            likesCount: 174,
                            viewsCount: 211))

        return post
    }
}
