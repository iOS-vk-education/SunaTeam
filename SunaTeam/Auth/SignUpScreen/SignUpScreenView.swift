//
//  SignUpScreenView.swift
//  SunaTeam
//
//  Created by Sergei Biryukov on 28.10.2024.
//

import Foundation
import SwiftUI

struct SignUpScreenView: View {
    var body: some View {
        Spacer()
        VStack(alignment: .leading) {
            Text("Registration")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .fontWeight(.bold)
                .padding(.bottom, 2)
            
            Text("Please enter your login and password. ")
                .font(.body)
                .fontWeight(.regular)
            
            VStack {
                TextFieldView(text: "Email", isSecureField: false)
                TextFieldView(text: "Password", isSecureField: true)
                TextFieldView(text: "Confirm password", isSecureField: true)
            }
            .padding(.top, 16)
        }
        .padding(.horizontal, 40)
        Spacer()
        ButtonView(
            text: "Create",
            width: 335,
            height: 56,
            backgroundColor: .blue,
            textColor: .white,
            paddingTop: 24,
            action: {
                
            }
        )
        .padding(.bottom, 20)
    }
}

#Preview {
    SignUpScreenView()
}
