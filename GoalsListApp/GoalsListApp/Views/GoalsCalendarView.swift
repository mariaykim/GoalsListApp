//
//  GoalsCalendarView.swift
//  GoalsListApp
//
//  Created by Maria Kim on 9/9/24.
//

import HorizonCalendar
import SwiftUI

struct GoalsCalendarView: View {
    
    @State var selectedDate: Date?
    var dayGoals: [GoalModel] = [.init(title: "testing1"), .init(title: "testing2"), .init(title: "testing3")]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            calendarView
            dayGoalsView
                .frame(height: UIScreen.main.bounds.height * 0.25)
                .frame(maxWidth: .infinity)
                .background(Color.green)
        }
        .padding(.bottom, 1) // TODO: fix
    }
    
    var calendarView: some View {
        let calendar = Calendar.current
        
        let startDate = calendar.date(from: DateComponents(year: 2024, month: 09, day: 01))!
        let endDate = calendar.date(from: DateComponents(year: 2025, month: 12, day: 31))!
        
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
    
    var dayGoalsView: some View {
        ScrollView {
            VStack {
                Text(selectedDate?.description ?? "No goals to display")
                    .font(.title)
                ForEach(dayGoals, id: \.self) { goal in
                    dayGoalsRowView(title: "Testing")
                }
            }
        }
        .padding(.all, 20)
    }
    
    @ViewBuilder
    func dayGoalsRowView(title: String) -> some View {
        HStack(spacing: 0) {
            Rectangle()
                .background(Color.blue)
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
    TabView {
        GoalsCalendarView()
            .tabItem {
                Label("calendar", systemImage: "calendar")
            }
    }
}
