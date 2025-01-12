//
//  OnboardingViewModel.swift
//  SunaTravel
//
//  Created by Иван Тарасюк on 13.12.2024.
//

import SwiftUI

class OnboardingViewModel: ObservableObject {
    @Published var currentPage: Int = 0
    
    var onboardingSlides = [
        OnboardingSlide(
            imageName: "firstBoard",
            title: "Life is short and the world is wide",
            subtitle: "At Suna Travel you can save the brightest moments of your travels and they will never be lost",
            backgroundColor: Color.white
        ),
        OnboardingSlide(
            imageName: "secondBoard",
            title: "It's a big world out there go explore",
            subtitle: "To get the best of your adventure you just need to leave and go where you like. We are waiting for you",
            backgroundColor: Color.white
        )
    ]
    
    var buttonText: String {
        currentPage == onboardingSlides.count - 1 ? "Get Started" : "Next"
    }
    
    func nextPage() {
        if currentPage < onboardingSlides.count - 1 {
            currentPage += 1
        }
    }
}
