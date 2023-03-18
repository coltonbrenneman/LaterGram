//
//  User.swift
//  LaterGram
//
//  Created by Colton Brenneman on 3/14/23.
//

import Foundation

class User {
    
    enum Key {
    static let message = "message"
    static let creationDate = "date"
    static let imageURL = "imageURL"
    static let uuid = "uuid"
    static let collectionType = "users"
    }
    
    var message: String
    var creationDate: Date
    var imageURL: String
    let uuid: String
    
    var dictionaryRepresentation: [String: AnyHashable] {
        [Key.message: self.message,
         Key.creationDate: self.creationDate.timeIntervalSince1970,
         Key.imageURL: self.imageURL,
         Key.uuid: self.uuid
        ]
    }
    
    init(message: String, creationDate: Date = Date(), imageURL: String, uuid: String) {
        self.message = message
        self.creationDate = creationDate
        self.imageURL = imageURL
        self.uuid = uuid
    }
}

extension User {
    convenience init?(fromDictionary dictionary: [String : Any]) {
        guard let message = dictionary[Key.message] as? String,
              let creationDate = dictionary[Key.creationDate] as? Double,
              let imageURL = dictionary[Key.imageURL] as? String,
              let uuid = dictionary[Key.uuid] as? String else {
              print("Check your date hoe")
              return nil }
        
        self.init(message: message, creationDate: Date(timeIntervalSince1970: creationDate), imageURL: imageURL, uuid: uuid)
    }
}

extension User: Equatable {
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.uuid == rhs.uuid
    }
}
