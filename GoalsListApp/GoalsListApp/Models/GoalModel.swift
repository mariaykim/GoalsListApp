//
//  GoalModel.swift
//  GoalsListApp
//
//  Created by Maria Kim on 9/3/24.
//

import Foundation

struct GoalModel: Identifiable, Hashable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func markAsCompleted() -> GoalModel {
        return GoalModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
