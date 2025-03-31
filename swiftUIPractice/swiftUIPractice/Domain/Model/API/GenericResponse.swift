//
//  GenericResponse.swift
//  swiftUIPractice
//
//  Created by Carolina Calderon on 31/3/25.
//

import Foundation

class GenericResponse<T: Codable>: Codable {
    let code: Int?
    let responseType: String?
    let message: String?
    let content: T?
    
    init(code: Int? = nil, responseType: String? = nil, message: String? = nil, content: T? = nil) {
        self.code = code
        self.responseType = responseType
        self.message = message
        self.content = content
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        code = try container.decodeIfPresent(Int.self, forKey: .code)
        responseType = try container.decodeIfPresent(String.self, forKey: .responseType)
        message = try container.decodeIfPresent(String.self, forKey: .message)
        content = try container.decodeIfPresent(T.self, forKey: .content)
    }
}
