//
//  Untitled.swift
//  Daily Helper
//
//  Created by Любовь Ушакова on 23.09.2024.
//

import Foundation

struct User: Codable {
    let id: String
    let email: String
    let password: String
    
    var name: String?
    var height: Double?
    var weight: Double?
    
    let joined: TimeInterval
    
    static func defaultUser() -> User {
            return User(id: "", email: "", password: "", name: "User", height: 0.0, weight: 0.0, joined: Date().timeIntervalSince1970)
        }
    
}

