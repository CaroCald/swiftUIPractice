//
//  FirebaseServiceImpl.swift
//  swiftUIPractice
//
//  Created by bayteq on 8/4/25.
//

import Foundation
import FirebaseAuth

public class FirebaseServiceImpl: AuthProtocol {
    //var currentUserFirebase: AsyncStream<UserFirebase>
    
    private let firebaseAuth: Auth
    
    init(auth: Auth = Auth.auth()) {
        self.firebaseAuth = auth // ✅ OK, using a default
    }

    public var currentUserId: String {
        return firebaseAuth.currentUser?.uid ?? ""
    }
    
    public var hasUser: Bool {
        return firebaseAuth.currentUser != nil
    }
    
    func authenticate(email: String, password: String) -> AsyncStream<Result<UserResponse, Error>> {
         return AsyncStream { continuation in
             firebaseAuth.signIn(withEmail: email, password: password) { result, error in
                 if let error = error {
                     continuation.yield(.failure(error))
                 } else {
                     continuation.yield(.success(UserResponse(content: OkResponse(response: true))))
                 }
                 continuation.finish()
             }
         }
     }
   
   func signOut() -> AsyncStream<Result<OkResponse, Error>> {
           return AsyncStream { continuation in
               do {
                   try firebaseAuth.signOut()
                   continuation.yield(.success(OkResponse(response: true)))
               } catch {
                   continuation.yield(.failure(error))
               }
               continuation.finish()
           }
       }
   
}
