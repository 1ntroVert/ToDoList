//
//  MainViewViewModel.swift
//  ToDoList
//
//  Created by a.shlauzer on 05.01.2024.
//

import Foundation
import FirebaseAuth

class MainViewViewModel: ObservableObject {
    
    @Published var currentUserId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    
    var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}
