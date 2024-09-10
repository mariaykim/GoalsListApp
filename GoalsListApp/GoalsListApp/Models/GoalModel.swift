//
//  GoalModel.swift
//  GoalsListApp
//
//  Created by Maria Kim on 9/3/24.
//

import Foundation

struct GoalModel: Identifiable, Hashable, Codable {
    let id: String
    let title: String
    let description: String
    let date: Date
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString,
         title: String,
         description: String = "",
         date: Date,
         isCompleted: Bool = false
    ) {
        self.id = id
        self.title = title
        self.description = description
        self.date = date
        self.isCompleted = isCompleted
    }
    
    func markAsCompleted() -> GoalModel {
        return GoalModel(id: id, title: title, description: description, date: date, isCompleted: !isCompleted)
    }
    
    func updatedGoal(title: String, description: String, date: Date) -> GoalModel {
        return GoalModel(id: id, title: title, description: description, date: date, isCompleted: isCompleted)
    }
}
