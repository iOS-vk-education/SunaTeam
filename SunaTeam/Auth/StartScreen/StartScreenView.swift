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
            HeaderView(largeText: "Sign in to continue")
            NavigationLink(destination: SignInScreenView()) {
                Text("Sign in to continue")
                    .font(.headline)
                    .frame(width: 335, height: 56)
                    .background(Color("ButtonColor2"))
                    .foregroundStyle(.white)
                    .cornerRadius(15)
                    .padding(.top, 24)
            }
            
            NavigationLink(destination: SignUpScreenView()) {
                Text("Create new account")
                    .font(.headline)
                    .frame(width: 335, height: 56)
                    .foregroundStyle(.black)
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.secondary, lineWidth: 1)
                    )
                    .padding(.top, 12)
            }
        }
    }
}

#Preview {
    StartScreenView()
}
