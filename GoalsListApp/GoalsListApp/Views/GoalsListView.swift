//
//  GoalsListView.swift
//  GoalsListApp
//
//  Created by Maria Kim on 9/2/24.
//

import SwiftUI

struct GoalsListView: View {
    
    @EnvironmentObject var viewModel: GoalsListViewViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.goals, id: \.self) { goal in
                GoalsListRowView(goal: goal)
                    .onTapGesture {
                        withAnimation(.linear) {
                            viewModel.markGoalCompleted(goal: goal)
                        }
                    }
            }
            .onDelete(perform: viewModel.deleteGoal)
            .onMove(perform: viewModel.moveGoal)
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
    .environmentObject(GoalsListViewViewModel())
}
