//
//  ScheduleCell.swift
//  Suna Travel
//
//  Created by Иван Тарасюк on 24.11.2024.
//

import SwiftUI

struct ScheduleCell: View {
    let item: ScheduleItem

    var body: some View {
        HStack {
            Image(item.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 70, height: 70)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            VStack(alignment: .leading, spacing: 5) {
                Text(item.date)
                    .font(.caption)
                    .foregroundColor(.gray)
                Text(item.title)
                    .font(.headline)
                Text(item.location)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
    }
}

struct ScheduleCell_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleCell(item: scheduleItems[0])
            .previewLayout(.sizeThatFits)
    }
}
