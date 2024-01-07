//
//  ProfileViewModel.swift
//  ToDoList
//
//  Created by a.shlauzer on 05.01.2024.
//

import Foundation

class ProfileViewModel: ObservableObject {
    
    private let authService = AuthService()
    private let storeService = StoreService()

    @Published var user: User? = nil
    
    init() {}
    
    func fetchUser() {
        guard let userId = authService.currentUserId else {
            return
        }
        
        storeService.fetchUser(id: userId) { user in
            self.user = user
        }
    }
    
    func logOut() {
        authService.logOut()
    }
}
