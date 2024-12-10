//
//  OnboardingViewController.swift
//  Suna Travel
//
//  Created by Иван Тарасюк on 12.11.2024.
//

import UIKit
import SwiftUI

struct OnboardingViewController: View {
    var onFinish: () -> Void
    
    var body: some View {
        Button("Get Started") {
            onFinish()
        }
    }
}
