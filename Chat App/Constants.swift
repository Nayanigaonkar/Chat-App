//
//  Constants.swift
//  Chat App
//
//  Created by Nayani Gaonkar on 14/08/22.
//



struct K {
    static let appName = "⚡️ChatApp"
    static let cellIdentifier = "ReusableCell"
    static let cellNibName = "MessageCell"
    static let registerSegue = "afterRegistration"
    static let loginSegue = "afterLogin"
    
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
