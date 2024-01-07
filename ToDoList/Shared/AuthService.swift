//
//  AuthService.swift
//  ToDoList
//
//  Created by a.shlauzer on 07.01.2024.
//

import FirebaseAuth
import Foundation

class AuthService {
    
    private let auth = Auth.auth()
    
    func addStateDidChangeListener(callback: @escaping (String?) -> (Void)) -> AuthStateDidChangeListenerHandle {
        return Auth.auth().addStateDidChangeListener { _, user in
            DispatchQueue.main.async {
                callback(user?.uid)
            }
        }
    }
    
    var isSigned: Bool {
        return auth.currentUser != nil
    }
    
    func logIn(email: String, password: String) {
        auth.signIn(withEmail: email, password: password)
    }
    
    func createUser(email: String, password: String, callback: @escaping (String) -> Void) {
        auth.createUser(withEmail: email, password: password) { result, error in
            guard let userId = result?.user.uid else {
                return
            }
            
            callback(userId)
        }
    }
    
    var currentUserId: String? {
        auth.currentUser?.uid
    }
    
    func logOut() {
        do {
            try auth.signOut()
        } catch {
            print(error)
        }
    }
}
