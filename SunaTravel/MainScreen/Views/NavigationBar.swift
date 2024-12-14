//
//  NavigationBar.swift
//  SunaTravel
//
//  Created by Иван Тарасюк on 14.12.2024.
//

import SwiftUI

fileprivate struct NavBarConstants {
    static let TabViewHeight: CGFloat = 70
    static let TabViewPadding: CGFloat = 10
}

struct NavigationBar: View {
    var body: some View {
        TabView {
            Text("")
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            Text("")
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Calendar")
                }
            
            Text("")
                .tabItem {
                    Image(systemName: "magnifyingglass.circle.fill")
                    Text("Search")
                }
            
            Text("")
                .tabItem {
                    Image(systemName: "message")
                    Text("Messages")
                }
            
            Text("")
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("Profile")
                }
        }
        .accentColor(.blue)
        .frame(height: NavBarConstants.TabViewHeight)
        .padding(.bottom, NavBarConstants.TabViewPadding)
    }
}

struct BottomNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar()
            .previewLayout(.sizeThatFits)
    }
}
