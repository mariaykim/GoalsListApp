//
//  GoalsListRowView.swift
//  GoalsListApp
//
//  Created by Maria Kim on 9/2/24.
//

import SwiftUI

struct GoalsListRowView: View {
    
    let goal: GoalModel
    
    var body: some View {
        HStack(spacing: 0) {
            Image(systemName: goal.isCompleted ? "checkmark.circle" : "circle")
                .foregroundStyle(goal.isCompleted ? .green : .red)
                .padding(.trailing, 10)
            Text(goal.title)
        }
        .font(.headline)
    }
}

#Preview {
    let item1 = GoalModel(title: "preview1", description: "describe this", date: "sometime 2025", isCompleted: true)
    return GoalsListRowView(goal: item1)
}
