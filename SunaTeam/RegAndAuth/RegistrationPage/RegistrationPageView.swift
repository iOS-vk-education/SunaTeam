//
//  RegistrationPageView.swift
//  SunaTeam
//
//  Created by Sergei Biryukov on 28.10.2024.
//

import Foundation
import SwiftUI

struct RegistrationPageView: View {
    @State private var data = ""
    
    var registerISDisabled: Bool {
        data.isEmpty
    }
    
    
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
                TextFieldView(text: "Email")
                    .padding(.top, 16)
                VStack {
                    TextSecureFieldView(text: "Password")
                    TextSecureFieldView(text: "Confirm password")
                }
            }
        }
        .padding(.horizontal, 40)
        Spacer()
        ButtonView(
            text: "Create",
            backgroundColor: .blue,
            textColor: .white,
            paddingTop: 24,
            action: {
                
            }
        )
        .padding(.bottom, 20)
    }
}

struct TextFieldView: View {
    @State private var data = ""
    var text: String
    var body: some View {
        TextField(text, text: $data)
            .padding(.horizontal, 24)
            .frame(width: 295, height: 58)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.secondary, lineWidth: 1)
            )
            .padding(.bottom, 8)
    }
}

struct TextSecureFieldView: View {
    @State private var data = ""
    var text: String
    var body: some View {
        SecureField(text, text: $data)
            .padding(.horizontal, 24)
            .frame(width: 295, height: 58)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.secondary, lineWidth: 1)
            )
            .padding(.bottom, 8)
    }
}

#Preview {
    RegistrationPageView()
}
