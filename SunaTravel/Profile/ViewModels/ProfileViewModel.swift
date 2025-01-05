//
//  ProfileViewModel.swift
//  Suna Travel
//
//  Created by salfetka on 17.12.2024.
//

import SwiftUI

class ProfileViewModel: ObservableObject {
    @Published var profile: ProfileData
    @Published var isSuccessMessageShowed: Bool = false
    
    init(profile: ProfileData) {
        self.profile = profile
    }
    
    func saveChanges(name: String, email: String, location: String, phoneNumber: String) {
        profile.name = name
        profile.email = email
        profile.location = location
        profile.phoneNumber = phoneNumber
        isSuccessMessageShowed = true
    }
}

