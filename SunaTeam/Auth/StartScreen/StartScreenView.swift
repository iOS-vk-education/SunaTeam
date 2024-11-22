//
//  StartScreenView.swift
//  SunaTeam
//
//  Created by Sergei Biryukov on 27.10.2024.
//
import ComposableArchitecture
import SwiftUI

struct StartScreenView: View {
    var body: some View {
        NavigationView {
            VStack {
                HeaderView(largeText: "Sign in to continue")
                Button {
                    return Void()
                } label: {
                    NavigationLink(destination: SignInScreenView()) {
                        Text("Sign in to continue")
                    }
                    .buttonStyle(YellowButtonStyle())
                    .padding(.top, 24)
                }
                
                Button {
                    return Void()
                } label: {
                    NavigationLink(destination: SignUpScreenView()) {
                        Text("Create new account")
                    }
                    .buttonStyle(ClearButtonStyle())
                    .padding(.top, 12)
                }
            }
            .padding(.horizontal, 40)
        }
    }
}

#Preview {
    StartScreenView()
}
