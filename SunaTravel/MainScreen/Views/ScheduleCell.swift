//
//  ScheduleCell.swift
//  SunaTravel
//
//  Created by Иван Тарасюк on 14.12.2024.
//

import SwiftUI

fileprivate struct ScheduleCellConstants {
    static let imageWidth: CGFloat = 70
    static let imageHeight: CGFloat = 70
    static let imageCornerRadius: CGFloat = 10
    static let verticalSpacing: CGFloat = 5
    static let horizontalPadding: CGFloat = 16
    static let backgroundCornerRadius: CGFloat = 15
    static let shadowColorOpacity: Double = 0.1
    static let shadowRadius: CGFloat = 5
    static let shadowOffsetX: CGFloat = 0
    static let shadowOffsetY: CGFloat = 5
}

struct ScheduleCell: View {
    let item: ScheduleItem

    var body: some View {
        HStack {
            Image(item.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: ScheduleCellConstants.imageWidth, height: ScheduleCellConstants.imageHeight)
                .clipShape(RoundedRectangle(cornerRadius: ScheduleCellConstants.imageCornerRadius))
            
            VStack(alignment: .leading, spacing: ScheduleCellConstants.verticalSpacing) {
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
        .padding(ScheduleCellConstants.horizontalPadding)
        .background(Color.white)
        .cornerRadius(ScheduleCellConstants.backgroundCornerRadius)
        .shadow(color: Color.black.opacity(ScheduleCellConstants.shadowColorOpacity),
                radius: ScheduleCellConstants.shadowRadius,
                x: ScheduleCellConstants.shadowOffsetX,
                y: ScheduleCellConstants.shadowOffsetY)
    }
}

struct ScheduleCell_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleCell(item: scheduleItems[0])
            .previewLayout(.sizeThatFits)
    }
}
