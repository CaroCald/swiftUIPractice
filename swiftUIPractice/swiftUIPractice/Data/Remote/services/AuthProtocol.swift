//
//  AuthProtocol.swift
//  swiftUIPractice
//
//  Created by bayteq on 8/4/25.
//

import Foundation
import Foundation
protocol AuthProtocol {
    func authenticate(email: String, password: String) -> AsyncStream<Result<UserResponse, Error>>
    func signOut() -> AsyncStream<Result<OkResponse, Error>>
}
