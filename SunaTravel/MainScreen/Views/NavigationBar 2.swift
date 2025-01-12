//
//  NavigationBar 2.swift
//  SunaTravel
//
//  Created by Иван Тарасюк on 05.01.2025.
//



struct NavigationBar: View {
    var body: some View {
        TabView {
            // Первая вкладка
            ForEach(navigationItems, id: \.title) { item in
                NavigationView {
                    NavigationLink(destination: item.destinationView) {
                        VStack {
                            Text("Go to \(item.title)")  // Измените текст на что-то более подходящее
                        }
                        .navigationBarTitle(item.title, displayMode: .inline) // Можно задать заголовок для каждой вкладки
                    }
                    .tabItem {
                        Image(systemName: item.systemImage)
                        Text(item.title)
                    }
                }
            }
        }
        .accentColor(.blue)
        .frame(height: UIConstants.TabViewHeight)
        .padding(.bottom, UIConstants.TabViewPadding)
    }
}