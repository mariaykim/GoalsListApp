//
//  GoalsListView.swift
//  GoalsListApp
//
//  Created by Maria Kim on 9/2/24.
//

import SwiftUI

struct GoalsListView: View {
    
    @State var goals: [GoalModel] = [
        .init(title: "This is the first", isCompleted: true),
        .init(title: "This is the second", isCompleted: true),
        .init(title: "This is the third", isCompleted: false)
    ]
    
    var body: some View {
        List {
            ForEach(goals, id: \.self) { goal in
                GoalsListRowView(goal: goal)
            }
        }
        .listStyle(.plain)
        .navigationTitle("Goals")
        .toolbar {
            EditButton()
        }
        .toolbar {
            NavigationLink("New Goal", destination: CreateGoalView())
        }
        
    }
}

#Preview {
    NavigationView {
        GoalsListView()
    }
}
