//
//  AuthUseCase.swift
//  swiftUIPractice
//
//  Created by Carolina Calderon on 31/3/25.
//

import Foundation
import FirebaseAuth
class AuthenticationUseCase {
    private let service: AuthProtocol
    
    init(service: AuthProtocol) {
        self.service = service
    }
    
    func authenticate(email: String, password: String) -> AsyncStream<Result<UserResponse, Error>> {
        return service.authenticate(email: email, password: password)
    }

    func signOut() -> AsyncStream<Result<OkResponse, Error>> {
        return service.signOut()
    }
    
    func isLogged() -> Bool {
        return false // sessionManager.isSavedSession()
    }


}
