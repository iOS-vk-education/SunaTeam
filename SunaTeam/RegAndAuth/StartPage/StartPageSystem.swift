//
//  StartPageSystem.swift
//  SunaTeam
//
//  Created by Sergei Biryukov on 28.10.2024.
//

import ComposableArchitecture

@Reducer
struct StartPageSystem {
    @ObservableState
    struct State {
        var regPageIsOpen: Bool = false
        var authPageIsOpen: Bool = false
    }
    
    enum Action {
        case registrationButtonTapped
        case authorizationButtonTapped
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .registrationButtonTapped:
                state.regPageIsOpen = true
                return .none
                
            case .authorizationButtonTapped:
                state.authPageIsOpen = true
                return .none
            }
        }
    }
}
