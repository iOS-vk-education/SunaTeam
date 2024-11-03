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
        NavigationView {
            Spacer()
            VStack(alignment: .center) {
                HeaderView(largeText: "Sign in now",
                           smallText: "Please sign in to continue our app")
                TextFieldView(text: "Email", isSecureField: false)
                    .padding(.top, 40)
                TextFieldView(text: "Password", isSecureField: true)
                HStack {
                    Spacer()
                    ForgetPasswordButtonView()
                }
            }
            .padding(.horizontal, 40)
            
            ButtonView(
                text: "Sign In",
                width: 335,
                height: 56,
                backgroundColor: Color("ButtonColor2"),
                textColor: .white,
                paddingTop: 24,
                action: {
                    
                }
            )
            .padding(.bottom, 40)
            
            SignUpPromptView()
                .padding(.horizontal, 8)
            Spacer()
        }
        .navigationBarItems(leading: Button(action: {
            // Возвращаемся к предыдущему экрану
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "arrow.left")
                .foregroundColor(.black)
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
        NavigationView {
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
}

#Preview {
    SignInScreenView()
}
