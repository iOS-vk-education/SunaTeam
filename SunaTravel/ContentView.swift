import SwiftUI

struct ViewTripView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> ViewTripViewController {
        return ViewTripViewController() // Создаём ваш UIKit экран
    }
    
    func updateUIViewController(_ uiViewController: ViewTripViewController, context: Context) {
        // Обновления, если нужно
    }
}

struct ContentView: View {
    var body: some View {
        ViewTripView() // Показываем UIKit экран вместо ContentView
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

