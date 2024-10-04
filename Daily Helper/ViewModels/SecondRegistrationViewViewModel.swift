//
//  Registration2ViewViewModel.swift
//  Daily Helper
//
//  Created by Любовь Ушакова on 25.09.2024.
//
import FirebaseFirestore
import FirebaseAuth
import Foundation

class SecondRegistrationViewViewModel: ObservableObject {
    @Published var user: User
    @Published var errorMessage = ""
 
    
    init(user: User) {
        self.user = user
    }
    
    func completeRegistration(name: String, height: Double, weight: Double) {
        user.name = name
        user.height = height
        user.weight = weight
        
        Auth.auth().createUser(withEmail: user.email, password: user.password) { [weak self] result, error in
            guard let userId = result?.user.uid else {
                return
            }
            
            self?.insertUserRecord(id: userId)
        }
    }
    
    private func insertUserRecord(id: String) {
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(user.asDictionary())
    }

}
    
