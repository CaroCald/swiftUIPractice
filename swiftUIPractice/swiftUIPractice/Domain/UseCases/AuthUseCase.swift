//
//  AuthUseCase.swift
//  swiftUIPractice
//
//  Created by Carolina Calderon on 31/3/25.
//

import Foundation
class AuthenticationUseCase {
    private let service: AccountService
    
    init(service: AccountService) {
        self.service = service
    }
    
    func login(user: UserRequest) -> AsyncStream<ApiResult<UserResponse>> {
        return AsyncStream { continuation in
            Task {
                for await result in service.authenticate(email: user.email, password: user.password) {
                    switch result {
                    case .success(let response):
                        //sessionManager.saveSession(true)
                        continuation.yield(ApiResult.success(response))

                    case .failure(let error):
                        continuation.yield(ApiResult.error(error))
                    }
                }
            }
        }
    }
    
    func logout() async {
       // sessionManager.clearSession()
        for await result in service.signOut() {
            switch result {
            case .success(let response):
                _ = ApiResult.success(response)
            case .failure(let error):
                _ = ErrorUtils.handleException(exception: error)
            }
        }
    }
    
    func getUserInfo() -> AsyncStream<UserFirebase> {
        return service.currentUserFirebase
    }
    
    func isLogged() -> Bool {
        return false //sessionManager.isSavedSession()
    }
}
