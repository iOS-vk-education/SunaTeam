//
//  SignUpScreenView.swift
//  SunaTeam
//
//  Created by Sergei Biryukov on 28.10.2024.
//

import Foundation
import SwiftUI

struct SignUpScreenView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack {
            HeaderView(largeText: RS.signUpbigTitle,
                       smallText: RS.signUpsmallTitle)
            TextFieldView(text: RS.signUpName, isSecureField: false)
                .padding(.top, 40)
            TextFieldView(text: RS.signUpemail, isSecureField: false)
            TextFieldView(text: RS.signUpPassword, isSecureField: true)
            
            Button {
                return Void()
            } label: {
                NavigationLink(destination: EmptyView()) {
                    Text(RS.signUp)
                }
                .buttonStyle(YellowButtonStyle())
                .padding(.top, 24)
            }
            .padding(.bottom, 40)
            
            HStack {
                Text(RS.signUphaveAccount)
                    .font(.system(size: 14))
                    .foregroundStyle(.secondary)
                Button {
                    return Void()
                } label: {
                    NavigationLink(destination: SignInScreenView()) {
                        Text(RS.SignIn)
                            .foregroundStyle(Color("ButtonColor1"))
                            .font(.system(size: 14))
                    }
                }
            }
        }
        .padding(.horizontal, 40)
        .navigationBarItems(leading: Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "arrow.left")
                .foregroundColor(.secondary)
        })
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    SignUpScreenView()
}
