//
//  CalendarHeaderView.swift
//  Suna Travel
//
//  Created by Иван Тарасюк on 24.11.2024.
//

import SwiftUI

struct CalendarHeaderView: View {
    // Получаем текущую дату
    let currentDate = Date()
    
    // Получаем календарь
    let calendar = Calendar.current
    
    // Массив для отображения дня недели с понедельника по воскресенье
    let weekdaySymbols =  ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]

    // Находим начало текущей недели (понедельник)
    var startOfWeek: Date {
        let weekday = calendar.component(.weekday, from: currentDate) // Позиция текущего дня недели (1 - воскресенье)
        let daysToSubtract = (weekday == 1) ? 6 : weekday - 2 // Если воскресенье, то вычитаем 6, иначе вычитаем количество дней до понедельника
        return calendar.date(byAdding: .day, value: -daysToSubtract, to: currentDate) ?? Date()
    }
    
    // Массив дат текущей недели (с понедельника по воскресенье)
    var weekDates: [Date] {
        return (0..<7).map { calendar.date(byAdding: .day, value: $0, to: startOfWeek)! }
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                ForEach(0..<7, id: \.self) { index in
                    let date = weekDates[index]
                    let dayOfMonth = calendar.component(.day, from: date)
                    let weekdaySymbol = weekdaySymbols[index]
                    
                    // Проверка: если текущая дата, выделяем её оранжевым цветом
                    let isToday = calendar.isDate(date, inSameDayAs: currentDate)
                    
                    VStack {
                        Text(weekdaySymbol) // Показать день недели (с понедельника)
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                        Text("\(dayOfMonth)") // Число месяца
                            .font(.title3.bold())
                            .foregroundColor(isToday ? Color.orange : Color.black) // Если сегодня - оранжевый
                            .frame(width: 40, height: 40)
                            .background(isToday ? Color.orange.opacity(0.2) : Color.clear)
                            .clipShape(Circle())
                    }
                }
            }
        }
        .padding(.horizontal)
        .padding(.top, 20)
    }
}

struct CalendarHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarHeaderView()
            .previewLayout(.sizeThatFits)
    }
}

