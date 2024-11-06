//
//  SignInScreenView.swift
//  SunaTeam
//
//  Created by Sergei Biryukov on 28.10.2024.
//

import ComposableArchitecture
import SwiftUI

struct SignInScreenView: View{
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack {
            HeaderView(largeText: "Sign in now",
                       smallText: "Please sign in to continue our app")
            TextFieldView(text: "Email", isSecureField: false)
                .padding(.top, 40)
            TextFieldView(text: "Password", isSecureField: true)
            
            HStack {
                Spacer()
                ForgetPasswordButtonView()
            }
            
            Button {
                return Void()
            } label: {
                NavigationLink(destination: EmptyView()) {
                    Text("Sign in")
                }
                .buttonStyle(YellowButtonStyle())
                .padding(.top, 24)
            }
            .padding(.bottom, 40)
            
            SignUpPromptView()
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

struct ForgetPasswordButtonView: View {
    var body: some View {
        Button {
            return Void()
        } label: {
            Text("Forget Password?")
                .foregroundStyle(Color("ButtonColor1"))
                .font(.system(size: 14))
        }
    }
}

struct SignUpPromptView: View {
    var body: some View {
        HStack {
            Text("Don't have an account")
                .font(.system(size: 14))
                .foregroundStyle(.secondary)
            Button {
                return Void()
            } label: {
                NavigationLink(destination: SignUpScreenView()) {
                    Text("Sign up")
                        .foregroundStyle(Color("ButtonColor1"))
                        .font(.system(size: 14))
                }
            }
        }
    }
}

#Preview {
    SignInScreenView()
}
