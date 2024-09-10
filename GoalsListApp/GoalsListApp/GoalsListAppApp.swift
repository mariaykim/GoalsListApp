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
                    }
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                    
                    NavigationView {
                        GoalsCalendarView()
                    }
                    .tabItem {
                        Label("Calendar", systemImage: "calendar")
                    }
                }
                .toolbarBackground(.visible, for: .tabBar)
                .toolbarBackground(Color.secondaryAccent, for: .tabBar)
            }
            .environmentObject(goalsListViewModel)
            .padding(.horizontal, 20)
        }
    }
}
