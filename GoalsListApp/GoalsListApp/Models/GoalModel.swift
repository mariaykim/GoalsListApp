//
//  GoalModel.swift
//  GoalsListApp
//
//  Created by Maria Kim on 9/3/24.
//

import Foundation

struct GoalModel: Identifiable, Hashable {
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
}
