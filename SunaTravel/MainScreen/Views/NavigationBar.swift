//
//  NavigationBar.swift
//  SunaTravel
//
//  Created by Иван Тарасюк on 14.12.2024.
//

import SwiftUI
import UIKit

fileprivate struct UIConstants {
    static let TabViewHeight: CGFloat = 70
    static let TabViewPadding: CGFloat = 10
}

class NavigationBar: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Устанавливаем цвет фона таббара в зависимости от темы
        tabBar.isTranslucent = false
        tabBar.barTintColor = UIColor { traitCollection in
            return traitCollection.userInterfaceStyle == .dark ? .black : .white
        }
        tabBar.tintColor = .systemBlue // Цвет иконок и выделенного элемента
        
        let homeView = UIHostingController(rootView: HomeScreenView())
        homeView.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        
        let calendarView = UIHostingController(rootView: MainView())
        calendarView.tabBarItem = UITabBarItem(title: "Calendar", image: UIImage(systemName: "calendar"), tag: 1)
        
        let searchView = UIHostingController(rootView: SearchScreenView())
        searchView.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass.circle.fill"), tag: 2)
        
        let mapView = EmptyViewController()
        mapView.tabBarItem = UITabBarItem(title: "Map", image: UIImage(systemName: "map"), tag: 3)
        
        let profileView = UIHostingController(rootView: ProfileView(viewModel: profileViewModel, showEditButton: true))
        profileView.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.circle"), tag: 4)
        
        viewControllers = [homeView, calendarView, searchView, mapView, profileView]
    }
}

class EmptyViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}

struct AppRootView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> NavigationBar {
        return NavigationBar()
    }
    
    func updateUIViewController(_ uiViewController: NavigationBar, context: Context) {}
}
