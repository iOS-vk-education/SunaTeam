//
//  SignInScreenView.swift
//  SunaTeam
//
//  Created by Sergei Biryukov on 28.10.2024.
//

import Foundation
import SwiftUI

struct SignInScreenView: View {
    var body: some View {
        Spacer()
        VStack(alignment: .center) {
            HeaderView()
            TextFieldView(text: "Email", isSecureField: false)
                .padding(.top, 40)
            TextFieldView(text: "Password", isSecureField: true)
            HStack {
                Spacer()
                ForgotPasswordButtonView()
            }
        }
        .padding(.horizontal, 40)
        
        ButtonView(
            text: "Sign In",
            width: 335,
            height: 56,
            backgroundColor: Color("ButtonColor1"),
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
}

struct HeaderView: View {
    var body: some View {
        Text("Sign in now")
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .fontWeight(.semibold)
            .padding(.bottom, 2)
        
        Text("Please sign in to continue our app")
            .font(.body)
            .fontWeight(.regular)
            .foregroundStyle(.secondary)
    }
}

struct ForgotPasswordButtonView: View {
    var body: some View {
        Button {
            return Void()
        } label: {
            Text("Forget Password?")
                .foregroundStyle(Color("ButtonColor2"))
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
                Text("Sign up")
                    .foregroundStyle(Color("ButtonColor2"))
                    .font(.system(size: 14))
            }
            
        }
    }
}

#Preview {
    SignInScreenView()
}
