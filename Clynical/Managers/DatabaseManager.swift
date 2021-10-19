//
//  DatabaseManager.swift
//  Clynical
//
//  Created by Suraj Dayma on 02/10/2021.
//

import FirebaseDatabase

public class DatabaseManager {
    static let shared = DatabaseManager()
    private let database = Database.database(url: "https://clynical-49376-default-rtdb.europe-west1.firebasedatabase.app").reference()
    
    // MARK: - Public
    
    /// Check if username and email are available
    /// - Parameters
    ///    - email: String representing email
    ///    - username: String representing username
    public func canCreateNewUser(with email: String, username: String, completion: @escaping (Bool) -> Void) {
        completion(true)
        return
    }
    
    /// Insert new user data to database
    /// - Parameters
    ///    - email: String representing email
    ///    - username: String representing username
    ///    - completion: Async callback for result if database entry succeded
    public func insertNewUser(with email: String, username: String,  completion: @escaping (Bool)-> Void){

        database.child(email.safeDatabaseKey()).setValue(["username": username]) { error, _ in
            if error == nil {
                //succeeded
                completion(true)
                return
            }
            else {
                //failed
                completion(false)
                return
            }
        }
    }
    
}
