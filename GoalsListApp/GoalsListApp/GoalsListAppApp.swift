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
            NavigationView {
                GoalsListView()
            }
            .environmentObject(goalsListViewModel)
            .padding(.horizontal, 20)
        }
    }
}
