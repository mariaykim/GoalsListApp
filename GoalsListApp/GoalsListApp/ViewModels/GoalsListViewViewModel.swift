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
    @Published var dayGoals: [GoalModel] = []
    
    let goalsListKey: String = "goals_list"
    
    init() {
        getGoals()
    }
    
    func getGoals() {
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
        if let index = goals.firstIndex(where: { $0.id == goal.id }) {
            goals[index] = goal.markAsCompleted()
        }
    }
    
    func updateGoal(goal: GoalModel) {
        if let index = goals.firstIndex(where: { $0.id == goal.id }) {
            goals[index] = goal
        }
    }
    
    func saveGoals() {
        if let encodedData = try? JSONEncoder().encode(goals) {
            UserDefaults.standard.set(encodedData, forKey: goalsListKey)
        }
    }
    
    func fetchDayGoals(date: Date?) {
        guard let date else { return }
        dayGoals = goals.filter({ $0.date == date.description })
    }
}
