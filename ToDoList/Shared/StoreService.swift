//
//  StoreService.swift
//  ToDoList
//
//  Created by a.shlauzer on 07.01.2024.
//

import FirebaseFirestore
import Foundation

class StoreService {
    
    private let usersKey = "users"
    private let todosKey = "todos"
    
    private let db = Firestore.firestore()
    
    func fetchUser(id: String, callback: @escaping (User) -> Void) {
        user(id: id).getDocument { snapshot, error in
            guard let data = snapshot?.data(), error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                callback(User(id: data["id"] as? String ?? "",
                                  name: data["name"] as? String ?? "",
                                  email: data["email"] as? String ?? "",
                                  joined: data["joined"] as? TimeInterval ?? 0
                             )
                         )
            }
        }
    }
    
    func addNewUser(id: String, name: String, email: String) {
        let newUser = User(id: id,
                           name: name,
                           email: email,
                           joined: Date().timeIntervalSince1970)
        
        user(id: id).setData(newUser.asDicrionary())
    }
    
    func addToDo(userId: String, title: String, dueDate: Date) {
        let newId = UUID().uuidString
        let newItem = ToDoListItem(id: newId,
                                   title: title,
                                   dueDate: dueDate.timeIntervalSince1970,
                                   createdDate: Date().timeIntervalSince1970,
                                   isDone: false)
        
        todo(userId: userId, id: newId).setData(newItem.asDicrionary())
    }
    
    func updateTodo(userId: String, itemCopy: ToDoListItem) {
        todo(userId: userId, id: itemCopy.id).setData(itemCopy.asDicrionary())
    }
    
    func deleteToDo(userId: String, id: String) {
        todo(userId: userId, id: id).delete()
    }
    
    private func users() -> CollectionReference {
        db.collection(usersKey)
    }
    
    private func user(id: String) -> DocumentReference {
        users().document(id)
    }
    
    private func todo(userId: String, id: String) -> DocumentReference {
        user(id: userId).collection(todosKey).document(id)
    }
}
