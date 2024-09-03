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
    @State var textFieldText: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            TextField("Type something here...", text: $textFieldText)
                .padding(.horizontal)
                .frame(height: 55)
                .background(Color.yellow)
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
            viewModel.addGoal(title: textFieldText)
            alertTitle = "SUCCESS"
            showAlert.toggle()
            dismiss()
        }
    }
    
    func goalValid() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Goal needs to be three characters long"
            showAlert.toggle()
            return false
        }
        return true
    }
    
}

#Preview {
    CreateGoalView()
        .environmentObject(GoalsListViewViewModel())
}
