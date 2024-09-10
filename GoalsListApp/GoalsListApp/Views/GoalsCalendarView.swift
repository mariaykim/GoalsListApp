//
//  GoalsCalendarView.swift
//  GoalsListApp
//
//  Created by Maria Kim on 9/9/24.
//

import HorizonCalendar
import SwiftUI
import UIKit

struct GoalsCalendarView: View {
    
    @EnvironmentObject var viewModel: GoalsListViewViewModel
    @State var selectedDate: Date?
    
    var body: some View {
        ZStack(alignment: .bottom) {
            calendarView
                .padding(.horizontal, 20)
        }
        .onAppear {
            if selectedDate != nil {
                viewModel.fetchDayGoals(date: selectedDate)
            }
        }
        .overlay(alignment: .bottom) {
            GoalsCalendarSelectedDayView(selectedDate: selectedDate)
                .frame(height: UIScreen.main.bounds.height * 0.25)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .padding(.bottom, 1) // TODO: fix
        }
    }
    
    var calendarView: some View {
        let calendar = Calendar.current
        
        let comp: DateComponents = Calendar.current.dateComponents([.year, .month, .day], from: Date())
        
        let startDate = calendar.date(from: DateComponents(year: comp.year, month: comp.month, day: comp.day))!
        let endDate = calendar.date(byAdding: .year, value: 5, to: startDate)!
        
        return CalendarViewRepresentable(
            calendar: calendar,
            visibleDateRange: startDate...endDate,
            monthsLayout: .vertical(options: VerticalMonthsLayoutOptions()),
            dataDependency: nil)
        .onDaySelection { day in
            selectedDate = calendar.date(from: day.components)
        }
        .days { [selectedDate] day in
            let date = calendar.date(from: day.components)
            let borderColor: UIColor = date == selectedDate ? .systemRed : .systemBlue
            
            Text("\(day.day)")
                .font(.system(size: 18))
                .foregroundColor(Color(UIColor.label))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .overlay {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color(borderColor), lineWidth: 1)
                }
        }
        .interMonthSpacing(24)
        .verticalDayMargin(8)
        .horizontalDayMargin(8)
    }
    
}

#Preview {
    TabView {
        GoalsCalendarView()
            .tabItem {
                Label("calendar", systemImage: "calendar")
            }
    }
}
