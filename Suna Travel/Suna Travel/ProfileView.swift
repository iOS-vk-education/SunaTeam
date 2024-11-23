//
//  ProfileView.swift
//  Suna Travel
//
//  Created by salfetka on 13.11.2024.
//

import Foundation
import SwiftUI

struct ProfileView: View {
    private let avatarSize = 100.0
    @ObservedObject var profileData: ProfileData
    
    var body: some View {
        NavigationView {
            VStack {
                //TitleView()
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: avatarSize, height: avatarSize)
                    .padding(.top)

                Text(profileData.name)
                    .font(.title2)
                Text(profileData.email)
                    .font(.subheadline)
                    .padding(.bottom)
                    .foregroundColor(.gray)
                
                HStack {
                    DataView(count: 360, title: "Reward Points")
                    Spacer()
                    DataView(count: 238, title: "Travel Tips")
                    Spacer()
                    DataView(count: 473, title: "Bucket List")
                }
                .padding()
                
                ListView()
                Spacer()
            }
            .padding()
            .navigationBarTitle("Profile", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: EditProfileView(profileData: profileData)) {
                        Image(systemName: "pencil")
                    }
                }
            }
        }
    }
}
struct DataView: View {
    let count: Int
    let title: String
    var body: some View {
        VStack {
            Text(String(count))
                .font(.title2)
            Text(title)
                .font(.footnote)
                .foregroundColor(.orange)
        }
    }
}
struct ListView: View {
    var body: some View {
        List {
            ListItem(title: "Bookmarks", destination: BookmarksView(), image: "bookmark.circle")
            ListItem(title: "Previous Trips", destination: PreviousTripsView(), image: "globe.europe.africa")
            ListItem(title: "Settings", destination: SettingsView(), image: "gearshape")
            ListItem(title: "About app", destination: VersionView(), image: "info.circle")
        }
        .listStyle(.plain)
    }
}

struct ListItem<Destination: View>: View {
    private let listButtonImageSize = 18.0
    private let listButtonSize = 52.0
    
    let title: String
    let destination: Destination
    let image: String
    
    var body: some View {
        NavigationLink(destination: destination) {
            Image(systemName: image)
                .resizable()
                .frame(width: listButtonImageSize, height: listButtonImageSize)
            Text(title)
                .padding(.vertical, 5)
                .background(Color.white)
                .cornerRadius(3)
                .multilineTextAlignment(.leading)

        }
        .frame(height: listButtonSize)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        let profileData = ProfileData(name: "Leonardo", email: "leonardo@gmail.com", location: "Moscow, Russia", phoneNumber: "+19993332211")

        ProfileView(profileData: profileData)
    }
}


