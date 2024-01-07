//
//  MainViewViewModel.swift
//  ToDoList
//
//  Created by a.shlauzer on 05.01.2024.
//

import Foundation
import FirebaseAuth

class MainViewModel: ObservableObject {
    
    private let authService = AuthService()
    
    @Published var currentUserId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        self.handler = authService.addStateDidChangeListener() { [weak self] userId in
            self?.currentUserId = userId ?? ""
        }
    }
    
    var isSigned: Bool {
        return authService.isSigned
    }
}
