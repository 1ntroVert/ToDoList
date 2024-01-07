//
//  ToDoListViewModel.swift
//  ToDoList
//
//  Created by a.shlauzer on 05.01.2024.
//

import Foundation

class ToDoListViewModel: ObservableObject {
    
    private let storeService = StoreService()
    
    @Published var showNewItemView = false
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    func delete(id: String) {
        storeService.deleteToDo(userId: userId, id: id)
    }
}
