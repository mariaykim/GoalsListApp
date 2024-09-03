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
        HStack {
            Image(systemName: goal.isCompleted ? "checkmark.circle" : "circle")
                .foregroundStyle(goal.isCompleted ? .green : .black)
            Text(goal.title)
        }
        .font(.headline)
        .padding(.horizontal)
    }
}

#Preview {
    let item1 = GoalModel(title: "preview1", isCompleted: true)
    return GoalsListRowView(goal: item1)
}
