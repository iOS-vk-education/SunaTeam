//
//  EditProfileView.swift
//  Suna Travel
//
//  Created by salfetka on 20.11.2024.
//

import Foundation
import SwiftUI

struct EditProfileView: View {
    private let avatarSize = 100.0
    
    @ObservedObject var profileData: ProfileData
    
    @State private var tempName: String
    @State private var tempEmail: String
    @State private var tempLocation: String
    @State private var tempPhoneNumber: String
    @State private var showSuccessMessage: Bool = false

    init(profileData: ProfileData) {
        self.profileData = profileData
        _tempName = State(initialValue: profileData.name)
        _tempEmail = State(initialValue: profileData.email)
        _tempLocation = State(initialValue: profileData.location)
        _tempPhoneNumber = State(initialValue: profileData.phoneNumber)
    }

    var body: some View {
        NavigationView {
            ScrollView {
                VStack() {
                    //EditTitleView()
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: avatarSize, height: avatarSize)
                        .padding(.top)

                    Button(action: {}) {
                        Text("Change Profile Picture")
                            .foregroundColor(.orange)
                    }

                    VStack(alignment: .leading, spacing: 15) {
                        ProfileInputField(title: "Name", text: $tempName)
                        ProfileInputField(title: "Email", text: $tempEmail)
                        ProfileInputField(title: "Location", text: $tempLocation)
                        ProfileInputField(title: "Mobile Number", text: $tempPhoneNumber)
                    }
                    .padding()
                    Spacer()
                }
            }
            .onTapGesture {
                hideKeyboard()
            }
            
        }
        .navigationBarTitle("Edit Profile", displayMode: .inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: saveChanges) {
                    Text("Save")
                        .fontWeight(.bold)
                        .foregroundColor(.orange)
                }
            }
        }
        .alert(isPresented: $showSuccessMessage) {
            Alert(
                title: Text("Success"),
                message: Text("Changes have been saved successfully.")
            )
        }
    }
    private func saveChanges() {
        profileData.name = tempName
        profileData.email = tempEmail
        profileData.location = tempLocation
        profileData.phoneNumber = tempPhoneNumber
        showSuccessMessage = true
    }
}



extension EditProfileView {
    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct ProfileInputField: View {
    let title: String
    @Binding var text: String
    

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
                .foregroundColor(.gray)
            TextField(title, text: $text)
                .padding()
                .background(Color(UIColor.systemGray6))
                .cornerRadius(8)
        }
    }
}
