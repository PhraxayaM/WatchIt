//
//  AuthManager.swift
//  WatchIt
//
//  Created by MattHew Phraxayavong on 8/4/22.
//

import Foundation
import FirebaseAuth
final class AuthManager {
    static let shared = AuthManager()
    
    private init() {}
    
    enum SignInMethod {
        case email
        case google
    }

    // PUBLIC
    
    public func signIn(with method: SignInMethod) {
        
    }
}
