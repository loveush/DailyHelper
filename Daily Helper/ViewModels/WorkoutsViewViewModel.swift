//
//  WorkoutsViewViewModel.swift
//  Daily Helper
//
//  Created by Любовь Ушакова on 14.10.2024.
//

import Foundation

class WorkoutsViewViewModel: ObservableObject {
    @Published var date = Date.now
    @Published var workouts: [Workout] = []
    @Published var counts = [Int:Int]()
    @Published var currentWorkouts: [Workout] = []
    
    init() {}
    
    func exampleWorkouts() {
        let workout = Workout(name: "Morning run", date: Date(), type: "Cardio", comment: "Example workout description", duration: 100000)
        let workout2 = Workout(name: "Evening run", date: Date(), type: "Cardio", comment: "Example workout description", duration: 100000)
        workouts.append(workout)
        workouts.append(workout2)
    }
    
    func setupCounts() {
        let mappedItems = workouts.map {($0.date.dayInt, 1)}
        counts = Dictionary(mappedItems, uniquingKeysWith: +)
    }
    
    func setCurrentWorkouts() {
        currentWorkouts = []
        for workout in workouts {
            if workout.date.dayInt == date.dayInt {
                currentWorkouts.append(workout)
            }
        }
    }
}
