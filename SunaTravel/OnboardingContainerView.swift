//
//  File.swift
//  SunaTravel
//
//  Created by Иван Тарасюк on 13.12.2024.
//

import SwiftUI

struct OnboardingConstants {
    static let buttonMinHeight: CGFloat = 50
    static let buttonHorizontalPadding: CGFloat = 20
    static let buttonBottomPadding: CGFloat = 20
    static let indicatorActiveWidth: CGFloat = 35
    static let indicatorActiveHeight: CGFloat = 8
    static let indicatorInactiveWidth: CGFloat = 8
    static let indicatorInactiveHeight: CGFloat = 8
    static let indicatorAnimationDuration: Double = 0.3
    static let buttonAnimationDuration: Double = 0.5
    static let hStackSpacing: CGFloat = 8
    static let circleOpacity: Double = 0.3
    static let buttonCornerRadius: CGFloat = 10
    static let buttonSkipCornerRadius: CGFloat = 4
    static let buttonSkipBackgroundOpacity: Double = 0.7
}

struct OnboardingContainerView: View {
    @Binding var isFirstLaunch: Bool
    @State private var currentPage = 0
    let slides = onboardingSlides
    let totalPages = onboardingSlides.count
    
    var body: some View {
        NavigationView {
            VStack {
                TabView(selection: $currentPage) {
                    ForEach(0..<slides.count) { index in
                        OnboardingView(slide: slides[index])
                            .tag(index)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .ignoresSafeArea(.all)
                
                HStack(spacing: OnboardingConstants.hStackSpacing) {
                    ForEach(0..<totalPages, id: \.self) { index in
                        if index == currentPage {
                            Capsule()
                                .fill(Color.accentBlue)
                                .frame(width: OnboardingConstants.indicatorActiveWidth, height: OnboardingConstants.indicatorActiveHeight)
                                .animation(.easeInOut(duration: OnboardingConstants.indicatorAnimationDuration), value: currentPage)
                        } else {
                            Circle()
                                .fill(Color.accentBlue.opacity(OnboardingConstants.circleOpacity))
                                .frame(width: OnboardingConstants.indicatorInactiveWidth, height: OnboardingConstants.indicatorInactiveHeight)
                                .animation(.easeInOut(duration: OnboardingConstants.indicatorAnimationDuration), value: currentPage)
                        }
                    }
                    .padding(.bottom, OnboardingConstants.buttonBottomPadding)
                }
                
                Button(action: {
                    withAnimation(.easeInOut(duration: OnboardingConstants.buttonAnimationDuration)) {
                        if currentPage < slides.count - 1 {
                            currentPage += 1
                        } else {
                            isFirstLaunch = false
                        }
                    }
                }) {
                    Text(currentPage == slides.count - 1 ? "Get Started" : "Next")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .frame(minHeight: OnboardingConstants.buttonMinHeight)
                        .background(Color.accentBlue)
                        .foregroundColor(Color.white)
                        .cornerRadius(OnboardingConstants.buttonCornerRadius)
                        .padding(.horizontal, OnboardingConstants.buttonHorizontalPadding)
                        .padding(.bottom, OnboardingConstants.buttonBottomPadding)
                }
            }
            .background(Color.white)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isFirstLaunch = false
                    }) {
                        Text("Skip")
                            .font(.headline)
                            .foregroundColor(Color.black)
                            .background(Color.gray.opacity(OnboardingConstants.buttonSkipBackgroundOpacity))
                            .cornerRadius(OnboardingConstants.buttonSkipCornerRadius)
                    }
                }
            }
        }
    }
}
