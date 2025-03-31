//
//  AccountService.swift
//  swiftUIPractice
//
//  Created by Carolina Calderon on 31/3/25.
//

import Foundation
protocol AccountService {
    var currentUserId: String { get }
    var hasUser: Bool { get }
    var currentUserFirebase: AsyncStream<UserFirebase> { get }
    
    func authenticate(email: String, password: String) -> AsyncStream<Result<UserResponse, Error>>
    func signOut() -> AsyncStream<Result<OkResponse, Error>>
}
