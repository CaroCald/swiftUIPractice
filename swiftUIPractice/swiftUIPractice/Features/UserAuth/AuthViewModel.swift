//
//  AuthViewModel.swift
//  swiftUIPractice
//
//  Created by bayteq on 8/4/25.
//

import Foundation

@MainActor
class AuthViewModel: ObservableObject {
    @Published var user: UserRequest?
    @Published var isLoggedIn: Bool = false
    @Published var errorMessage: String?
    

    private let accountService: AccountRepository

    init(accountService: AccountRepository) {
        self.accountService = accountService
    }

    func login(email: String, password: String) {
        Task {
            for await result in accountService.login(user:  UserRequest( email: email, password: password)) {
                switch result {
                case .success(let response):
                    print("Login Success: \(response)")
                    isLoggedIn = true
                    errorMessage = nil
                case .failure(let error):
                    errorMessage = error.localizedDescription
                    isLoggedIn = false
                }
            }
        }
    }

}
