//
//  Workout.swift
//  Daily Helper
//
//  Created by Любовь Ушакова on 14.10.2024.
//
import SwiftData
import Foundation

enum WorkoutType: String {
    case cardio = "Cardio"
    case strength = "Strength"
    case flexibility = "Flexibility"
    case balance = "Balance"
}

@Model
class Workout {
    var name: String
    var date: Date
    var type: String
    var comment: String
    var duration: TimeInterval
    
    init(name: String = "", date: Date, type: String = "", comment: String = "", duration: TimeInterval) {
        self.name = name
        self.date = date
        self.type = type
        self.comment = comment
        self.duration = duration
    }
}
