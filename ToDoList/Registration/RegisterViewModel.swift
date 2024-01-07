//
//  RegisterViewModel.swift
//  ToDoList
//
//  Created by a.shlauzer on 05.01.2024.
//

import Foundation

class RegisterViewModel: ObservableObject {
    
    private let authService = AuthService()
    private let storeService = StoreService()
    
    @Published var fullName = ""
    @Published var email = ""
    @Published var password = ""
    
    init() {}
    
    func register() {
        guard validate() else {
            return
        }

        authService.createUser(email: email, password: password) { userId in
            self.storeService.addNewUser(id: userId, name: self.fullName, email: self.email)
        }
    }
    
    private func validate() -> Bool {
        guard !fullName.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            return false
        }
        
        guard password.count >= 6 else {
            return false
        }
        
        return true
    }
}
