//
//  ToDoListItemViewModel.swift
//  ToDoList
//
//  Created by a.shlauzer on 05.01.2024.
//

import Foundation

class ToDoListItemViewModel: ObservableObject {
    
    private let authService = AuthService()
    private let storeService = StoreService()
    
    init() {}
    
    func toggleIsDone(item: ToDoListItem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let userId = authService.currentUserId else {
            return
        }
        
        storeService.updateTodo(userId: userId, itemCopy: itemCopy)
    }
}
