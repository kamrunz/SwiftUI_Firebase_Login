//
//  User.swift
//  FirebaseLogin
//
//  Created by Kamran Namazov on 04.05.23.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    let fullname: String
    let email: String
    
    var initials: String {
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullname) {
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        return "" 
    }
}

extension User {
    static var MOCK_USER = User(id: NSUUID().uuidString, fullname: "Kamran Namazov", email: "kamran@example.com")
}
