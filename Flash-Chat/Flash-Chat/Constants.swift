//
//  Constants.swift
//  Flash-Chat
//
//  Created by Nikita Zubov on 27.03.2023.
//

struct K {
    static let appName = "⚡️FlashChat"
    static let cellIdentifier = "ReusableCell"
    static let cellNibName = "MessageCell"
    static let registerSegue = "RegisterToChat"
    static let loginSegue = "LoginToChat"
    
    struct BrandColors {
        static let blue = "BrandBlue"
        static let lightBlue = "BrandLightBlue"
        static let orange = "BrandOrange"
        static let lighOrange = "BrandLightOrange"
        static let white = "BrandWhite"
    }
    
    struct FStore {
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
}
