//
//  UserModel.swift
//  VIP-svc-user
//
//  Created by Emmet Susslin on 7/12/17.
//  Copyright © 2017 Emmet Susslin. All rights reserved.
//

import Foundation


struct Constants {
    
    // API key
    static let api_key = ""
    
    
    //API endpoint to get array of top rated movies
    static let user_url = ""
    
    
    
}

//// API call here
//var users = [User]()
//
//let user1 = User(id: "1", firstName: "bob", lastName: "bobby", email: "bob@bobby.com")
//let user2 = User(id: "2", firstName: "phil", lastName: "philly", email: "phil@philly.com")
//
//
class User {
    
    let id: Int
    let firstName: String
    let lastName: String
    let email: String
    
    
    init(id: Int, firstName: String, lastName: String, email: String) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
    }
    
}
