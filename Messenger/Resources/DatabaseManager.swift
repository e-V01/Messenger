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
        
        var safeEmail = email.replacingOccurrences(of: ".", with: "-")
        // helps with crash at email
        safeEmail = safeEmail.replacingOccurrences(of: "@", with: "-")
    
        database.child(safeEmail).observeSingleEvent(of: .value, with: { snapshot in
            guard snapshot.value as? String != nil else {
                completion(false)
                return
            }
            
            completion(true)
        })
        
    }
    
    
    ///  Insert new user to database
    public func insertUser(with user: ChatAppUser) {
        database.child(user.safeEmail).setValue([
            "first_name": user.firstName,
            "last_name": user.lastName
            
        ])
        
        //    public func test() {
        //
        //        database.child("foo").setValue(["something": true])
    }
}

struct ChatAppUser {
    
    let firstName: String
    let lastName: String
    let emailAddress: String
    
    // password isn`t necessary to store encrypted
    
    var safeEmail: String {
        var safeEmail = emailAddress.replacingOccurrences(of: ".", with: "-")
        // helps with crash at email
        safeEmail = safeEmail.replacingOccurrences(of: "@", with: "-")
        return safeEmail
    }
    
    
//    let profilePictureURL: String
}
