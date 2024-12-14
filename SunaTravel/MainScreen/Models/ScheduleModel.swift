//
//  ScheduleModel.swift
//  SunaTravel
//
//  Created by Иван Тарасюк on 14.12.2024.
//

import Foundation

struct ScheduleItem: Identifiable {
    let id = UUID()
    let date: String
    let title: String
    let location: String
    let imageName: String
}

let scheduleItems = [
    ScheduleItem(date: "26 January 2022", title: "Niladri Reservoir", location: "Tekergat, Sunamgnj", imageName: "FirstTrip"),
    ScheduleItem(date: "26 January 2022", title: "High Rech Park", location: "Zeero Point, Sylhet", imageName: "SecondTrip"),
    ScheduleItem(date: "26 January 2022", title: "Darma Reservoir", location: "Darma, Kuningan", imageName: "ThirdTrip")
]
