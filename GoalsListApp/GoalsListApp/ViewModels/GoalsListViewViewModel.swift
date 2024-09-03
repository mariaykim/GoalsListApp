//
//  GoalsListViewViewModel.swift
//  GoalsListApp
//
//  Created by Maria Kim on 9/3/24.
//

import Foundation

final class GoalsListViewViewModel: ObservableObject {
    
    @Published var goals: [GoalModel] = []
    
    init() {
        getGoals()
    }
    
    func getGoals() {
        let newGoals = [
            GoalModel(title: "This is the first", isCompleted: true),
            GoalModel(title: "This is the second", isCompleted: true),
            GoalModel(title: "This is the third", isCompleted: false)
        ]
        goals.append(contentsOf: newGoals)
    }
    
    func deleteGoal(indexSet: IndexSet) {
        goals.remove(atOffsets: indexSet)
    }
    
    func moveGoal(from: IndexSet, to: Int) {
        goals.move(fromOffsets: from, toOffset: to)
    }
    
    func addGoal(title: String) {
        let newGoal = GoalModel(title: title, isCompleted: false)
        goals.append(newGoal)
    }
    
    func markGoalCompleted(goal: GoalModel) {
//        if let index = goals.firstIndex { (existingGoal) -> Bool in
//            return existingGoal.id == goal.id
//        } {
//            // then do this
//        }
        if let index = goals.firstIndex(where: { $0.id == goal.id }) {
            goals[index] = goal.markAsCompleted()
        }
        
    }
}
