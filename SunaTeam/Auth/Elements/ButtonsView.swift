//
//  Buttons.swift
//  SunaTeam
//
//  Created by Sergei Biryukov on 27.10.2024.
//

import Foundation
import SwiftUI

struct YellowButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline)
            .frame(maxWidth: .infinity, minHeight: 56)
            .background(Color("ButtonColor2"))
            .foregroundStyle(.white)
            .cornerRadius(15)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}

struct ClearButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline)
            .frame(maxWidth: .infinity, minHeight: 56)
            .foregroundStyle(.black)
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color("TextFieldColor")) // Цвет фона кнопки
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color("TextFieldColor"), lineWidth: 1) // Цвет обводки
                    )
            )
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}
