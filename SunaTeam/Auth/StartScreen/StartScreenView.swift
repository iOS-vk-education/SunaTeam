//
//  StartScreenView.swift
//  SunaTeam
//
//  Created by Sergei Biryukov on 27.10.2024.
//
import SwiftUI

struct StartScreenView: View {
    var body: some View {
        NavigationView {
            VStack {
                HeaderView(largeText: RS.startTitle)
                Button {
                    return Void()
                } label: {
                    NavigationLink(destination: SignInScreenView()) {
                        Text(RS.startSignInButton)
                    }
                    .buttonStyle(YellowButtonStyle())
                    .padding(.top, 24)
                }
                
                Button {
                    return Void()
                } label: {
                    NavigationLink(destination: SignUpScreenView()) {
                        Text(RS.startSignUpButton)
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
