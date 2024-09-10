//
//  GoalsCalendarSelectedDayRowView.swift
//  GoalsListApp
//
//  Created by Maria Kim on 9/9/24.
//

import SwiftUI

struct GoalsCalendarSelectedDayRowView: View {
    let title: String
    
    var body: some View {
        HStack(spacing: 0) {
            Rectangle()
                .background(Color.pink)
                .frame(maxWidth: 15)
                .padding(.trailing, 10)
            Text(title)
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
