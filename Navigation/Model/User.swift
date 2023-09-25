import Foundation
import UIKit

class User {

    var name: String
    var image: UIImage?
    var status: String

    init (name: String, image: UIImage, status: String) {
        self.name = name
        self.image = image
        self.status = status
    }
}

protocol UserServiceProtocol {
    func getUser(name: String) -> User?
}

//оставить в этом файле? или перенести в UserData?
final class CurrentUserService: UserServiceProtocol {

    private var currentUser: User?

    init(initialUser: User? = nil) {
        self.currentUser = initialUser
    }

    func getUser(name: String) -> User? {
        if currentUser?.name == name {
            return currentUser
        } else {
            return nil
        }
    }
}
