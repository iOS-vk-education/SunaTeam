//
//  ScheduleModel.swift
//  SunaTravel
//
//  Created by Иван Тарасюк on 14.12.2024.
//

import Foundation
import SwiftUI

struct ScheduleItem: Identifiable {
    let id = UUID()
    let date: Date
    let title: String
    let location: String
    let imageName: String
}

let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "dd MMMM yyyy"
    formatter.locale = Locale(identifier: "en_US_POSIX")
    return formatter
}()

let scheduleItems = [
    ScheduleItem(date: dateFormatter.date(from: "26 January 2022") ?? Date(), title: "Niladri Reservoir", location: "Tekergat, Sunamgnj", imageName: "FirstPlace"),
    ScheduleItem(date: dateFormatter.date(from: "26 January 2022") ?? Date(), title: "High Rech Park", location: "Zeero Point, Sylhet", imageName: "SecondPlace"),
    ScheduleItem(date: dateFormatter.date(from: "26 January 2022") ?? Date(), title: "Darma Reservoir", location: "Darma, Kuningan", imageName: "ThirdPlace")
]
