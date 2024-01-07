//
//  ToDoListViewModel.swift
//  ToDoList
//
//  Created by a.shlauzer on 05.01.2024.
//

import FirebaseFirestore
import Foundation

class ToDoListViewModel: ObservableObject {
    
    @Published var showNewItemView = false
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    func delete(id: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
