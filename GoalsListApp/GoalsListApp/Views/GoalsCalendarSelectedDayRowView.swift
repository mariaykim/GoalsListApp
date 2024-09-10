//
//  GoalsCalendarSelectedDayRowView.swift
//  GoalsListApp
//
//  Created by Maria Kim on 9/9/24.
//

import SwiftUI

struct GoalsCalendarSelectedDayRowView: View {
    
    @Environment(\.colorScheme) var colorScheme
    let title: String
    
    var body: some View {
        HStack(spacing: 0) {
            Rectangle()
                .fill(colorScheme == .dark ? .white : .black)
                .frame(maxWidth: 15)
                .padding(.trailing, 10)
            Text(title)
                .foregroundStyle(colorScheme == .dark ? .white : .black)
            Spacer()
        }
        .padding(.all, 10)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .border(Color.black)
    }
}

#Preview {
    GoalsCalendarSelectedDayRowView(title: "preview title")
}
