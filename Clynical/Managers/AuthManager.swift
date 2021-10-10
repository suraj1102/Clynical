//
//  AuthManager.swift
//  Clynical
//
//  Created by Suraj Dayma on 06/10/2021.
//

import FirebaseAuth

public class AuthManager {
    static let shared = AuthManager()
    
    // MARK : - Public
    
    public func registerNewUser(username: String, email: String, password: String, completion: @escaping (Bool)->Void) {
        /*
         1. Check if username is available
         2. Check if email is available
         3. Creat Account
         4. Insert account to database
         */
        
        // Step 1 and 2
        DatabaseManager.shared.canCreateNewUser(with: email, username: username) { canCreate in
            if canCreate {
                // Step 3 and 4
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    guard error == nil, result != nil else {
                    //Firebase auth could not create account
                        completion(false)
                        return
                    }
                    // Insert into database
                    DatabaseManager.shared.insertNewUser(with: email, username: username) { inserted in
                        if inserted {
                            completion(true)
                            return
                        }
                        else {
                            // Failed to insert to database
                            completion(false)
                            return
                        }
                    }
                }
            }
            else{
                //either username or email does not
                completion(false)
            }
        }
    }
    
    public func loginUser(username: String?, email: String?, password: String, completion: @escaping (Bool) -> Void) {
        
        if let email = email {
            // email log in
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                guard authResult != nil, error == nil else {
                    completion(false)
                    return
                }
                completion(true)
            }
        } else if let username = username {
            // username log in
            print(username)
        }
    }
}
