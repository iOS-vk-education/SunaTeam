//
//  SignUpScreenView.swift
//  SunaTravel
//
//  Created by Иван Тарасюк on 18.12.2024.
//

import Foundation
import SwiftUI

struct SignUpScreenView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var isNavigatingToHome = false
    @State private var shouldHideBackButton = false

    var body: some View {
        NavigationView {
            VStack {
                HeaderView(largeText: "Sign up now",
                           smallText: "Please fill the details and create an account")
                
                TextFieldView(text: "Name", isSecureField: false)
                    .padding(.top, 40)
                TextFieldView(text: "Email", isSecureField: false)
                TextFieldView(text: "Password", isSecureField: true)
                
                NavigationLink(destination: HomeScreenView(), isActive: $isNavigatingToHome) {
                    Button("Sign Up") {
                        isNavigatingToHome = true
                        shouldHideBackButton = true
                    }
                    .buttonStyle(YellowButtonStyle())
                    .padding(.top, 24)
                }
                .padding(.bottom, 40)
                
                HStack {
                    Text("Already have an account")
                        .font(.system(size: 14))
                        .foregroundStyle(.secondary)
                    
                    Button("Sign in") {
                        presentationMode.wrappedValue.dismiss()
                    }
                    .foregroundStyle(Color.blue)
                    .font(.system(size: 14))
                }
            }
            .padding(.horizontal, 40)
            .navigationBarBackButtonHidden(shouldHideBackButton) 
        }
    }
}
