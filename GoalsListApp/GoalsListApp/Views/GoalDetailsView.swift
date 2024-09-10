//
//  GoalDetailsView.swift
//  GoalsListApp
//
//  Created by Maria Kim on 9/9/24.
//

import SwiftUI

struct GoalDetailsView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: GoalsListViewViewModel
    
    @State var titleTextFieldText: String = ""
    @State var descriptionTextFieldText: String = ""
    @State var goalDate: Date = Date()
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    let goal: GoalModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                Text("Goal Title:")
                TextField(goal.title, text: $titleTextFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .clipShape(.rect(cornerRadius: 10))
                    .padding(.bottom, 15)
                
                Text("Goal Description:")
                TextField(goal.description, text: $descriptionTextFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .clipShape(.rect(cornerRadius: 10))
                    .padding(.bottom, 15)
                
                DatePicker(
                    "Goal Date:",
                    selection: $goalDate,
                    in: Date()...,
                    displayedComponents: [.date]
                )
                .padding(.bottom, 15)
                
                Button(action: updateGoal, label: {
                    Text("UPDATE")
                        .foregroundStyle(Color.white)
                        .padding(.all)
                        .frame(maxWidth: .infinity)
                })
                .background(Color.blue)
                .clipShape(.rect(cornerRadius: 10))
                
            }
            .padding(.horizontal)
            .navigationTitle(goal.title)
            .alert(isPresented: $showAlert) {
                Alert(title: Text(alertTitle))
            }
            .onAppear {
                titleTextFieldText = goal.title
                descriptionTextFieldText = goal.description
                goalDate = goal.date
            }
        }
    }
    
    func updateGoal() {
        if goalValid() {
            viewModel.updateGoal(goal: goal.updatedGoal(title: titleTextFieldText, description: descriptionTextFieldText, date: goalDate))
            alertTitle = "SUCCESS"
            showAlert.toggle()
            dismiss()
        }
    }
    
    func goalValid() -> Bool {
        if titleTextFieldText.count < 3 {
            alertTitle = "Goal needs to be three characters long"
            showAlert.toggle()
            return false
        }
        return true
    }
    
}

#Preview {
    GoalDetailsView(goal: GoalModel(title: "TITLE", description: "DESC", date: Date.now, isCompleted: false))
}
