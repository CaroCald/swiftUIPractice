//
//  UserAPIRequest.swift
//  swiftUIPractice
//
//  Created by Carolina Calderon on 31/3/25.
//

import Foundation
struct UserRequest: Codable {
    let email: String
    let password: String
    
    init(email: String = "", password: String = "") {
        self.email = email
        self.password = password
    }
}
