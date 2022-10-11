//
//  DatabaseManager.swift
//  WatchIt
//
//  Created by MattHew Phraxayavong on 8/4/22.
//

import Foundation
import FirebaseDatabase

final class DatabaseManager {
    static let shared = DatabaseManager()
    
    private let database = Database.database().reference()
    
    private init() {}

    // PUBLIC
    
    public func getAllUsers(completion: ([String]) -> Void ) {
        
    }
}
