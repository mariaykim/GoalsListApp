//
//  NoGoalsView.swift
//  GoalsListApp
//
//  Created by Maria Kim on 9/3/24.
//

import SwiftUI

struct NoGoalsView: View {
    
    @State var animate: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 5) {
                Image(systemName: "house")
                Text("No goals")
                    .font(.title)
                Text("Click the button below to create your first goal!!!")
                    .multilineTextAlignment(.center)
                NavigationLink(
                    destination: CreateGoalView(),
                    label: {
                        Text("Create")
                            .font(.headline)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(animate ? .blue : .secondaryAccent)
                            .foregroundStyle(.white)
                            .clipShape(.rect(cornerRadius: 10))
                })
            }
            .padding(.horizontal)
            .onAppear {
                addAnimation()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(.easeInOut) {
                animate.toggle()
            }
        }
    }
}

#Preview {
    NavigationView {
        NoGoalsView()
    }
    .navigationTitle("Title")
}
