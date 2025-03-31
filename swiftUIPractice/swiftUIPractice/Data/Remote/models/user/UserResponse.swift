//
//  UserAPIResponse.swift
//  swiftUIPractice
//
//  Created by Carolina Calderon on 31/3/25.
//

import Foundation
class UserResponse: GenericResponse<OkResponse> {
    override init(code: Int? = nil, responseType: String? = nil, message: String? = nil, content: OkResponse? = nil) {
        super.init(code: code, responseType: responseType, message: message, content: content)
    }
    
    required init(from decoder: Decoder) throws {
           try super.init(from: decoder)
    }
}
