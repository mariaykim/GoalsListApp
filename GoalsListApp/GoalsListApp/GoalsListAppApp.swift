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
                    
                    GoalsCalendarView()
                        .tabItem {
                            Label("Calendar", systemImage: "calendar")
                        }
                }
                .toolbarBackground(.blue.opacity(0.1), for: .tabBar)
                .toolbarBackground(.visible, for: .tabBar)
                .toolbarColorScheme(.dark, for: .tabBar)
            }
            .environmentObject(goalsListViewModel)
            .padding(.horizontal, 20)
        }
    }
}
