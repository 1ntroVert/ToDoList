//
//  NewItemViewModel.swift
//  ToDoList
//
//  Created by a.shlauzer on 05.01.2024.
//

import FirebaseFirestore
import Foundation

class NewItemViewModel: ObservableObject {
    
    private let authService = AuthService()
    
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
        
        let newId = UUID().uuidString
        let newItem = ToDoListItem(id: newId,
                                   title: title,
                                   dueDate: dueDate.timeIntervalSince1970,
                                   createdDate: Date().timeIntervalSince1970,
                                   isDone: false)
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(currentUserId)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDicrionary())
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
