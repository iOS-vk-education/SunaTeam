import SwiftUI

struct CreateTripView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> CreateTripViewController {
        return CreateTripViewController() // Создаём ваш UIKit экран
    }
    
    func updateUIViewController(_ uiViewController: CreateTripViewController, context: Context) {
        // Обновления, если нужно
    }
}

struct ContentView: View {
    var body: some View {
        CreateTripView() // Показываем UIKit экран вместо ContentView
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

