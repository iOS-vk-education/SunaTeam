//
//  Buttons.swift
//  SunaTeam
//
//  Created by Sergei Biryukov on 27.10.2024.
//

import Foundation
import SwiftUI

struct ButtonView: View {
    var text: String
    var width: CGFloat = 295
    var height: CGFloat = 56
    var backgroundColor: Color?
    var textColor: Color
    var borderColor: Color?
    var paddingTop: CGFloat = 0
    var action: () -> Void

    var body: some View {
        Button(action: {
            
        }, label: {
            Text(text)
                .font(.headline)
                .foregroundColor(textColor)
                .frame(width: width, height: height)
                .background(backgroundColor)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(borderColor ?? Color.clear, lineWidth: borderColor != nil ? 1 : 0)
                )
                .cornerRadius(15)
                .padding(.top, paddingTop)
        })
    }
}
