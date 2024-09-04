//
//  CreateGoalView.swift
//  GoalsListApp
//
//  Created by Maria Kim on 9/3/24.
//

import SwiftUI

struct CreateGoalView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: GoalsListViewViewModel
    @State var titleTextFieldText: String = ""
    @State var descriptionTextFieldText: String = ""
    @State var dateTextFieldText: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            TextField("Goal Title...", text: $titleTextFieldText)
                .padding(.horizontal)
                .frame(height: 55)
                .background(Color(UIColor.secondarySystemBackground))
                .clipShape(.rect(cornerRadius: 10))
            
            TextField("Goal Description...", text: $descriptionTextFieldText)
                .padding(.horizontal)
                .frame(height: 55)
                .background(Color(UIColor.secondarySystemBackground))
                .clipShape(.rect(cornerRadius: 10))
            
            TextField("Goal Date...", text: $dateTextFieldText)
                .padding(.horizontal)
                .frame(height: 55)
                .background(Color(UIColor.secondarySystemBackground))
                .clipShape(.rect(cornerRadius: 10))
            
            Button(action: saveGoal, label: {
                Text("SAVE")
                    .foregroundStyle(Color.white)
                    .padding(.all)
                    .frame(maxWidth: .infinity)
            })
            .background(Color.blue)
            .clipShape(.rect(cornerRadius: 10))
            
        }
        .padding(.horizontal)
        .navigationTitle("Create new goal")
        .alert(isPresented: $showAlert) {
            Alert(title: Text(alertTitle))
        }
    }
    
    func saveGoal() {
        if goalValid() {
            viewModel.addGoal(title: titleTextFieldText, description: descriptionTextFieldText, date: dateTextFieldText)
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
    NavigationView {
        CreateGoalView()
            .environmentObject(GoalsListViewViewModel())
    }
}
