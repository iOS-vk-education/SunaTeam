//
//  Suna_TravelApp.swift
//  Suna Travel
//
//  Created by salfetka on 03.11.2024.
//

import SwiftUI

@main
struct Suna_TravelApp: App {
    @AppStorage("isFirstLaunch") var isFirstLaunch: Bool = true
    var body: some Scene {
        WindowGroup {
            if isFirstLaunch {
                OnboardingContainerView(isFirstLaunch: $isFirstLaunch)
            } else {
                ContentView()
            }
        }
    }
}
