//
//  Delegete&DataSource.swift
//  SunaTravel
//
//  Created by Иван Тарасюк on 12.01.2025.
//

import UIKit
import SwiftUI


extension FavoritePlacesViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    
    // Конфигурируем ячейки
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoritePlaceCell", for: indexPath) as! FavoritePlaceCell
        let place = MockData.places[indexPath.item]
        cell.configure(with: place)
        cell.didSelectPlace = {
            // Обработка нажатия на ячейку
            self.didTapCell(with: place)
        }
        return cell
    }
    
    // Метод обработки нажатия на ячейку
    func didTapCell(with place: Place) {
        // Создаем новый экран с деталями о месте
        let detailViewController = UIHostingController(rootView: ViewTripViewControllerWrapper())
        // Переход на новый экран
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}
