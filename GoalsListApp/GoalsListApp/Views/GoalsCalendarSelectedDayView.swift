//
//  GoalsCalendarSelectedDayView.swift
//  GoalsListApp
//
//  Created by Maria Kim on 9/9/24.
//

import SwiftUI

struct GoalsCalendarSelectedDayView: View {
    
    @EnvironmentObject var viewModel: GoalsListViewViewModel
    let selectedDate: Date?
    
    var body: some View {
        VStack(spacing: 5) {
            Text(selectedDate?.formatted(date: .long, time: .omitted) ?? "Select a date")
                .font(.title)
            ScrollView {
                ForEach(viewModel.dayGoals, id: \.self) { goal in
                    NavigationLink(destination: CreateGoalView(), label: {
                        GoalsCalendarSelectedDayRowView(title: goal.title)
                    })
                }
            }
        }
        .padding(.top, 10)
        .padding(.horizontal, 20)
        .onChange(of: selectedDate) {
            viewModel.fetchDayGoals(date: selectedDate)
        }
    }
}

#Preview {
    GoalsCalendarSelectedDayView(selectedDate: Date.now)
}
