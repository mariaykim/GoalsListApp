//
//  GoalsListViewViewModel.swift
//  GoalsListApp
//
//  Created by Maria Kim on 9/3/24.
//

import Foundation

final class GoalsListViewViewModel: ObservableObject {
    
    @Published var goals: [GoalModel] = [] {
        didSet {
            saveGoals()
        }
    }
    let goalsListKey: String = "goals_list"
    
    
    init() {
        getGoals()
    }
    
    func getGoals() {
//        let newGoals = [
//            GoalModel(title: "This is the first", description: "First description", date: "2025", isCompleted: true),
//            GoalModel(title: "This is the second", description: "2nd description", date: "2026", isCompleted: true),
//            GoalModel(title: "This is the third", description: "3rd description", date: "2027", isCompleted: false)
//        ]
        guard let data = UserDefaults.standard.data(forKey: goalsListKey),
              let savedGoals = try? JSONDecoder().decode([GoalModel].self, from: data)
        else { return }
        
        self.goals = savedGoals
    }
    
    func deleteGoal(indexSet: IndexSet) {
        goals.remove(atOffsets: indexSet)
    }
    
    func moveGoal(from: IndexSet, to: Int) {
        goals.move(fromOffsets: from, toOffset: to)
    }
    
    func addGoal(title: String, description: String, date: String) {
        let newGoal = GoalModel(title: title, description: description, date: date, isCompleted: false)
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
    
    func saveGoals() {
        if let encodedData = try? JSONEncoder().encode(goals) {
            UserDefaults.standard.set(encodedData, forKey: goalsListKey)
        }
    }
}
