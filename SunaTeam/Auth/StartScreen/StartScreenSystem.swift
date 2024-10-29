//
//  StartScreenSystem.swift
//  SunaTeam
//
//  Created by Sergei Biryukov on 28.10.2024.
//

import ComposableArchitecture

@Reducer
struct StartScreenSystem {
    @ObservableState
    struct State {
        var signUpScreenIsOpen: Bool = false
        var signInScreenIsOpen: Bool = false
    }
    
    enum Action {
        case signUpButtonTapped
        case signInButtonTapped
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .signUpButtonTapped:
                state.signUpScreenIsOpen = true
                return .none
                
            case .signInButtonTapped:
                state.signInScreenIsOpen = true
                return .none
            }
        }
    }
}
