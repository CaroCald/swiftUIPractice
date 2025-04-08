//
//  AuthRepository.swift
//  swiftUIPractice
//
//  Created by bayteq on 8/4/25.
//

import Foundation
import Combine
import FirebaseAuth
public final class AccountRepository {
    
    private let authenticationUseCase: AuthenticationUseCase
    
     init(authenticationUseCase: AuthenticationUseCase) {
        self.authenticationUseCase = authenticationUseCase
    }
    
    func login(user: UserRequest) -> AsyncStream<Result<UserResponse, Error>> {
        return authenticationUseCase.authenticate(email: user.email, password: user.password)
    }
    func logout() async throws {
        try await authenticationUseCase.signOut()
    }
    
    
}
