//
//  ProfileView.swift
//  SunaTravel
//
//  Created by Иван Тарасюк on 24.12.2024.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var viewModel: ProfileViewModel
    let showEditButton: Bool
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                if showEditButton {
                    NavigationLink(destination: EditProfileView(viewModel: viewModel)) {
                        Image(systemName: "pencil")
                            .foregroundColor(.primary)
                    }
                    .padding()
                } else {
                    
                }
            }
            Spacer()
            if let avatar = viewModel.profile.avatar {
                Image(uiImage: avatar)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .padding(.top)
            } else {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .padding(.top)
            }
            
            Text(viewModel.profile.name)
                .font(.title2)
                .foregroundColor(.primary)
            Text(viewModel.profile.email)
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.bottom)
                .foregroundColor(.secondary)
            
            //MARK: – Статистика – на будущее
            //                HStack {
            //                    ProfileInfoItem(count: viewModel.profile.rewardPointsCount, title: "Reward Points")
            //                    Spacer()
            //                    ProfileInfoItem(count: viewModel.profile.travelTipsCount, title: "Travel Tips")
            //                    Spacer()
            //                    ProfileInfoItem(count: viewModel.profile.bucketListCount, title: "Bucket List")
            //                }
            //                .padding()
            
            ProfileNavigationLinks()
            Spacer()
        }
        .padding()
        .navigationBarTitle("Profile", displayMode: .inline)
        .navigationBarHidden(showEditButton)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: EditProfileView(viewModel: viewModel)) {
                    Image(systemName: "pencil")
                        .foregroundColor(.primary)
                }
            }
        }
    }
}

struct ProfileInfoItem: View {
    let count: Int
    let title: String
    
    var body: some View {
        VStack {
            Text("\(count)")
                .font(.title2)
                .foregroundColor(.primary)
            Text(title)
                .font(.footnote)
                .foregroundColor(.orange)
        }
    }
}
