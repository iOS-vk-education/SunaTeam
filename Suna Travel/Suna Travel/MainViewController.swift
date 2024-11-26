//
//  MainViewController.swift
//  Suna Travel
//
//  Created by Иван Тарасюк on 24.11.2024.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView {
            VStack {
                // Календарь
                CalendarHeaderView()
                // Секция "My Schedule"
                VStack(alignment: .leading) {
                    HStack {
                        Text("My Schedule")
                            .font(.title3.bold())
                        Spacer()
                        Button(action: {
                            // Действие для кнопки "View All"
                        }) {
                            Text("View all")
                                .font(.callout)
                                .foregroundColor(.blue)
                        }
                    }
                    .padding(.horizontal)
                    
                    // Список поездок
                    ScrollView {
                        LazyVStack(spacing: 20) {
                            ForEach(scheduleItems) { item in
                                ScheduleCell(item: item)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.top)
                NavigationBar()
            }
            .navigationBarTitle("Schedule", displayMode: .inline)
            .navigationBarItems(
                leading: Button(action: {
                    // Действие для кнопки назад
                }) {
                    Image(systemName: "arrow.backward")
                        .foregroundColor(.black)
                },
                trailing: Button(action: {
                    // Действие для кнопки уведомлений
                }) {
                    Image(systemName: "person.crop.circle")
                        .foregroundColor(.black)
                }
                
            )
        }
        .background(Color(.systemGray6)) // Фон экрана
        .edgesIgnoringSafeArea(.all)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
