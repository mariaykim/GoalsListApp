//
//  CreateGoalView.swift
//  GoalsListApp
//
//  Created by Maria Kim on 9/3/24.
//

import SwiftUI
import UserNotifications

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
            VStack {
                TextField("Goal Title...", text: $titleTextFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .clipShape(.rect(cornerRadius: 10))
                    .padding(.bottom, 15)
                
                TextField("Goal Description...", text: $descriptionTextFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .clipShape(.rect(cornerRadius: 10))
                    .padding(.bottom, 15)
                
                TextField("Goal Date...", text: $dateTextFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .clipShape(.rect(cornerRadius: 10))
                    .padding(.bottom, 15)
                
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
    }
    
    func saveGoal() {
        if goalValid() {
            DispatchQueue.main.async {
                scheduleTimeBasedNotification()
            }
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
    
    func scheduleTimeBasedNotification() {
        // 1. Request permission to display alerts and play sounds.
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { granted, error in
            if granted {
                print("Permission granted")
            } else if let error = error {
                print(error.localizedDescription)
            }
        }

        // 2. Create the content for the notification
        let content = UNMutableNotificationContent()
        content.title = "Reminder"
        content.body = "Don't forget to check the app!"
        content.sound = UNNotificationSound.default

        // 3. Set up a trigger for the notification
        // For example, 5 seconds from now
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: (5), repeats: false)

        // 4. Create the request
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

        // 5. Add the request to the notification center
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("Notification scheduled")
            }
        }
    }
    
}

#Preview {
    NavigationView {
        CreateGoalView()
            .environmentObject(GoalsListViewViewModel())
    }
}
