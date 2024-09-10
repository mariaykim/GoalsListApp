//
//  GoalsListDatePickerView.swift
//  GoalsListApp
//
//  Created by Maria Kim on 9/10/24.
//

import SwiftUI

struct GoalsListDatePickerView: View {
    
    @State private var goalDate = Date()
    let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let comp: DateComponents = Calendar.current.dateComponents([.year, .month, .day], from: Date())
        let startComponents = DateComponents(year: comp.year, month: comp.month, day: comp.day)
        let endComponents = DateComponents(year: comp.year, month: 12, day: 31)
        return calendar.date(from:startComponents)!
            ...
            calendar.date(from:endComponents)!
    }()
    
    var body: some View {
        DatePicker(
            "Goal Date",
             selection: $goalDate,
             in: dateRange,
             displayedComponents: [.date]
        )
        .datePickerStyle(.wheel)
        .labelsHidden()
    }
}

#Preview {
    GoalsListDatePickerView()
}
