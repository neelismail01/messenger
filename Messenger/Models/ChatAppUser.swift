//
//  ChatAppUser.swift
//  Messenger
//
//  Created by Neel Ismail on 2021-12-31.
//

import Foundation

struct ChatAppUser {
    let firstName: String
    let lastName: String
    let emailAddress: String
    
    var safeEmail: String {
        let safeEmail = emailAddress.replacingOccurrences(of: ".", with: "-").replacingOccurrences(of: "@", with: "-")
        return safeEmail
    }
    
    var profilePictureFileName: String {
        return "\(safeEmail)_profile_picture.png"
    }
}
