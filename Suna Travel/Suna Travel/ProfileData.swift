//
//  ProfileData.swift
//  Suna Travel
//
//  Created by salfetka on 20.11.2024.
//

import SwiftUI
import Combine

class ProfileData: ObservableObject {
    @Published var name: String
    @Published var email: String
    @Published var location: String
    @Published var phoneNumber: String
    
    init(name: String, email: String, location: String, phoneNumber: String) {
        self.name = name
        self.email = email
        self.location = location
        self.phoneNumber = phoneNumber
    }
}
