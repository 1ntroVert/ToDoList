//
//  ToDoListItemViewModel.swift
//  ToDoList
//
//  Created by a.shlauzer on 05.01.2024.
//

import FirebaseFirestore
import Foundation

class ToDoListItemViewModel: ObservableObject {
    
    private let authService = AuthService()
    
    init() {}
    
    func toggleIsDone(item: ToDoListItem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let userId = authService.currentUserId else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDicrionary())
    }
}
