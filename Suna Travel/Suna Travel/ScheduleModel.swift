//
//  ScheduleModel.swift
//  Suna Travel
//
//  Created by Иван Тарасюк on 24.11.2024.
//

import Foundation

// Модель расписания
struct ScheduleItem: Identifiable {
    let id = UUID()
    let date: String
    let title: String
    let location: String
    let imageName: String
}

// Пример данных
let scheduleItems = [
    ScheduleItem(date: "26 January 2022", title: "Niladri Reservoir", location: "Tekergat, Sunamgnj", imageName: "image1"),
    ScheduleItem(date: "26 January 2022", title: "High Rech Park", location: "Zeero Point, Sylhet", imageName: "image2"),
    ScheduleItem(date: "26 January 2022", title: "Darma Reservoir", location: "Darma, Kuningan", imageName: "image3")
]
