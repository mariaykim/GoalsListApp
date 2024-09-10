//
//  GoalsListView.swift
//  GoalsListApp
//
//  Created by Maria Kim on 9/2/24.
//

import SwiftUI

struct GoalsListView: View {
    
    @Environment(\.editMode) var editMode
    @EnvironmentObject var viewModel: GoalsListViewViewModel
    
    var body: some View {
        ZStack {
            if viewModel.goals.isEmpty {
                NoGoalsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List {
                    ForEach(viewModel.goals, id: \.self) { goal in
                        GoalsListRowView(goal: goal)
                    }
                    .onDelete(perform: viewModel.deleteGoal)
                    .onMove(perform: viewModel.moveGoal)
                }
                .listStyle(.plain)
            }
        }
        .navigationTitle("Goals")
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                NavigationLink(destination: CreateGoalView(), label: {
                    Image(systemName: "gear")
                })
            }
        }
        .toolbar(.visible, for: .navigationBar)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                EditButton()
            }
        }
        .toolbar {
            NavigationLink("New Goal", destination: CreateGoalView())
        }
        .toolbar(viewModel.goals.isEmpty ? .hidden : .visible, for: .navigationBar)
    }
    
}

#Preview {
    NavigationView {
        GoalsListView()
    }
    .environmentObject(GoalsListViewViewModel())
}
