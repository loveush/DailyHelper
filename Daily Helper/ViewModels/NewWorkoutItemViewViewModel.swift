//
//  NewWorkoutItemViewViewModel.swift
//  Daily Helper
//
//  Created by Любовь Ушакова on 20.10.2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewWorkoutItemViewViewModel: ObservableObject {
    @Published var name = ""
    @Published var type = "Cardio"
    @Published var startDate = Date()
    @Published var endDate = Date()
    @Published var comment = ""
    @Published var errorMessage = ""
    
    let workoutTypes: [String] = ["Cardio", "Strength", "Flexibility", "Balance"]
    
    init(startDate: Date = Date(), endDate: Date = Date()) {
            self.startDate = startDate
            self.endDate = endDate
        }
    
    func save() {
        guard canSave else {
            return
        }
        
        // Get current user id
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        // Create model
        let newId = UUID().uuidString
        let newWorkoutItem = Workout(
            id: newId,
            name: name,
            type: type,
            startDate: startDate,
            endDate: endDate,
            comment: comment
            )
        
        print("New Workout Item: \(newWorkoutItem)")
        
        // Save model
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("workouts")
            .document(newId)
            .setData(newWorkoutItem.asDictionary())
        
    }
    
    var canSave: Bool {
        errorMessage = ""
        
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please enter a title"
            return false
        }
        
        guard startDate < endDate else {
            errorMessage = "Please set the correct time"
            return false
        }
        
        return true
    }
    
}
