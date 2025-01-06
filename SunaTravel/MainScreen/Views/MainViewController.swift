//
//  MainViewController.swift
//  SunaTravel
//
//  Created by Иван Тарасюк on 14.12.2024.
//

import SwiftUI

fileprivate struct UIConstants {
    static let VStackSpacing: CGFloat = 20
}

struct MainView: View {
    var body: some View {
        VStack {
            CalendarHeaderView()
            VStack(alignment: .leading) {
                HStack {
                    Text("My Schedule")
                        .font(.title3.bold())
                    Spacer()
                }
                .padding(.horizontal)
                
                ScrollView {
                    LazyVStack(spacing: UIConstants.VStackSpacing) {
                        ForEach(scheduleItems) { item in
                            ScheduleCell(item: item)
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .padding(.top)
        }
        //.background(Color(.systemGray6))
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
