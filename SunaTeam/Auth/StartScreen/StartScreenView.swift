//
//  ContentView.swift
//  SunaTeam
//
//  Created by Sergei Biryukov on 27.10.2024.
//
import ComposableArchitecture
import SwiftUI

struct StartScreenView: View {
    let store: StoreOf<StartScreenSystem>
    var body: some View {
        VStack {
            TitleView()
            ButtonView(
                text: "Continue with email",
                width: 335,
                height: 56,
                backgroundColor: .blue,
                textColor: .white,
                paddingTop: 24,
                action: {
                    store.send(.signInButtonTapped)
                }
            )
            
            ButtonView(
                text: "Create new account",
                width: 335,
                height: 56,
                textColor: .black,
                borderColor: .secondary,
                paddingTop: 12,
                action: {
                    store.send(.signUpButtonTapped)
                }
            )
        }
    }
}

struct TitleView: View {
    var body: some View {
        Text("Sign in to continue")
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .fontWeight(.bold)
            .frame(width: 295.0, height: 36.0)
    }
}


#Preview {
    StartScreenView(
        store: Store(initialState: StartScreenSystem.State()) {
            StartScreenSystem()
        }
    )
}
