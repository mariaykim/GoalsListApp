//
//  GoalsListAppApp.swift
//  GoalsListApp
//
//  Created by Maria Kim on 9/2/24.
//

import SwiftUI

@main
struct GoalsListAppApp: App {
    
    @StateObject var goalsListViewModel: GoalsListViewViewModel = GoalsListViewViewModel()
    
    var body: some Scene {
        WindowGroup {
            TabView {
                Group {
                    NavigationView {
                        GoalsListView()
                            .padding(.horizontal, 20)
                    }
                    .tabItem {
                        Label("List", systemImage: "list.bullet.rectangle")
                    }
                    
                    NavigationView {
                        GoalsCalendarView()
                    }
                    .tabItem {
                        Label("Calendar", systemImage: "calendar")
                    }
                }
                .toolbarBackground(.visible, for: .tabBar)
            }
            .environmentObject(goalsListViewModel)
        }
    }
}
