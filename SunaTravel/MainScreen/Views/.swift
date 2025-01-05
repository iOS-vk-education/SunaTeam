//
//  NavigationBar 2.swift
//  SunaTravel
//
//  Created by Иван Тарасюк on 05.01.2025.
//


struct NavigationBar: View {
    var body: some View {
        NavigationView { // Один NavigationView на весь TabView
            TabView {
                ForEach(navigationItems, id: \.title) { item in
                    item.destinationView
                        .tabItem {
                            Image(systemName: item.systemImage)
                            Text(item.title)
                        }
                }
            }
            .accentColor(.blue)
            .frame(height: UIConstants.TabViewHeight)
            .padding(.bottom, UIConstants.TabViewPadding)
        }
    }
}