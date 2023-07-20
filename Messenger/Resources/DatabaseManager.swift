//
//  DatabaseManager.swift
//  Messenger
//
//  Created by Y K on 20.07.2023.
//

import Foundation
import FirebaseDatabase

final class DatabaseManager { // it cannot be subclass
    
    static let shared = DatabaseManager() // singleton
    
    private let database = Database.database().reference()
    
  
    
}

// MARL: - Account management
extension DatabaseManager {
    
    public func userExists(with email: String,
                           completion: @escaping ((Bool) -> Void)) {
    
        database.child(email).observeSingleEvent(of: .value, with: { snapshot in
            guard snapshot.value as? String != nil else {
                completion(false)
                return
            }
            completion(true)
        })
        
    }
    
    
    ///  Insert new user to database
    public func insertUser(with user: ChatAppUser) {
        database.child(user.emailAddress).setValue([
            "first_name": user.firstName,
            "last_name": user.lastName,
            
        ])
        
        //    public func test() {
        //
        //        database.child("foo").setValue(["something": true])
    }
}

struct ChatAppUser {
    
    let firstName: String
    let lastName: String
    let emailAddress: String // password isn`t necessary to store encrypted
//    let profilePictureURL: String
}
