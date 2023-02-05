//
//  Constants.swift
//  Flash Chat iOS13
//
//  Created by Simone Margio
//  www.simonemargio.im
//

import Foundation

struct K {
    static let cellIdentifier = "ReusableCell" // Single cell on the chatViewController into TableView
    static let cellNibName = "MessageCell"
    static let registerSegue = "RegisterToChat"
    static let loginSegue = "LoginToChat"
    
    struct appInfo {
        static let appName = "⚡️FlashChat"
        static let chatTitle = "Chat 😎"
    }
    
    struct BrandColors {
        static let purple = "BrandPurple"
        static let lightPurple = "BrandLightPurple"
        static let blue = "BrandBlue"
        static let lighBlue = "BrandLightBlue"
    }
    
    struct FStore {
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
}
