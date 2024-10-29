//
//  ContentView.swift
//  SunaTeam
//
//  Created by Sergei Biryukov on 27.10.2024.
//
import ComposableArchitecture
import SwiftUI

struct StartPageView: View {
    let store: StoreOf<StartPageSystem>
    var body: some View {
        VStack {
            TitleView()
            ButtonView(
                text: "Continue with email",
                backgroundColor: .blue,
                textColor: .white,
                paddingTop: 24,
                action: {
                    store.send(.authorizationButtonTapped)
                }
            )
            
            ButtonView(
                text: "Create new account",
                textColor: .black,
                borderColor: .secondary,
                paddingTop: 12,
                action: {
                    store.send(.registrationButtonTapped)
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
    StartPageView(
        store: Store(initialState: StartPageSystem.State()) {
            StartPageSystem()
        }
    )
}
