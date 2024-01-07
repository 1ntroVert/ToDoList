//
//  NewItemViewModel.swift
//  ToDoList
//
//  Created by a.shlauzer on 05.01.2024.
//

import Foundation

class NewItemViewModel: ObservableObject {
    
    private let authService = AuthService()
    private let storeService = StoreService()
    
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    init() {}
    
    func save() {
        guard canSave else {
            return
        }
        
        guard let currentUserId = authService.currentUserId else {
            return
        }
        
        storeService.addToDo(userId: currentUserId, title: title, dueDate: dueDate)
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: CharacterSet.whitespaces).isEmpty else {
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
    }
}
