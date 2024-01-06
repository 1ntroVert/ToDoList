//
//  User.swift
//  ToDoList
//
//  Created by a.shlauzer on 05.01.2024.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
