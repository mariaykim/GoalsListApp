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
    let date: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString,
         title: String,
         description: String,
         date: String,
         isCompleted: Bool
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
}
