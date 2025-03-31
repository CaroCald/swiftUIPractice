//
//  UserFirebase.swift
//  swiftUIPractice
//
//  Created by Carolina Calderon on 31/3/25.
//

import Foundation

struct UserFirebase {
    let id: String
    let isAnonymous: Bool
    let email: String?
    
    init(id: String = "", isAnonymous: Bool = true, email: String? = "") {
        self.id = id
        self.isAnonymous = isAnonymous
        self.email = email
    }
}
