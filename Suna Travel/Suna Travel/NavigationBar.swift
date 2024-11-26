//
//  NavigationBar.swift
//  Suna Travel
//
//  Created by Иван Тарасюк on 25.11.2024.
//

import SwiftUI

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
        .accentColor(.blue) // Цвет активной вкладки
        .frame(height: 70) // Устанавливаем высоту NavigationBar
        .padding(.bottom, 10) // Добавляем отступ снизу, если нужно
    }
}

struct BottomNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar()
            .previewLayout(.sizeThatFits)
    }
}
