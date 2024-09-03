//
//  CreateGoalView.swift
//  GoalsListApp
//
//  Created by Maria Kim on 9/3/24.
//

import SwiftUI

struct CreateGoalView: View {
    
    @State var textFieldText: String = ""
    
    var body: some View {
        ScrollView {
            TextField("Type something here...", text: $textFieldText)
                .padding(.horizontal)
                .frame(height: 55)
                .background(Color.red)
                .clipShape(.capsule)
            
            Button(action: {
                
            }, label: {
                Text("SAVE")
                    .foregroundStyle(Color.white)
                    .padding(.all)
                    .background(Color.blue)
            })
        }
        .navigationTitle("Create new goal")
    }
}

#Preview {
    CreateGoalView()
}
