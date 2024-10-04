//
//  LoginViewViewModel.swift
//  Daily Helper
//
//  Created by Любовь Ушакова on 22.09.2024.
//

import Foundation
import FirebaseAuth

class LoginViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {}
    
    func login() {
        guard validate() else {
            return
        }
        
        //Try log in
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    private func validate() -> Bool {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please, fill in all the fields"
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please, enter the correct email"
            return false
        }
        
        return true
    }
}
