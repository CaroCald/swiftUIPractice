//
//  OkResponse.swift
//  swiftUIPractice
//
//  Created by Carolina Calderon on 31/3/25.
//

import Foundation
struct OkResponse: Codable {
    let response: Bool
    
    init(response: Bool = true) {
        self.response = response
    }
}
