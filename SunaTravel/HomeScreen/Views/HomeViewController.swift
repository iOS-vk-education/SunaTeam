//
//  HomeScreenView.swift
//  SunaTravel
//
//  Created by salfetka on 21.12.2024.
//

import Foundation

import UIKit
import SwiftUI

class HomeViewController: UIViewController {

    private let viewModel = HomeViewModel()

    // MARK: - UI Components
    
    private let profileButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Leonardo", for: .normal)
        button.setImage(UIImage(systemName: "person.circle.fill"), for: .normal)
        button.tintColor = .black
        button.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.layer.cornerRadius = 6
        button.layer.masksToBounds = true
        return button
    }()

    
    private let notificationButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "bell.badge"), for: .normal)
        button.tintColor = .black
        button.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        button.layer.cornerRadius = 11
        button.layer.masksToBounds = true
        return button
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Explore the\nBeautiful world!"
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        let attributedString = NSMutableAttributedString(string: label.text!)
        attributedString.addAttribute(.foregroundColor, value: UIColor.orange, range: NSRange(location: 22, length: 6))
        label.attributedText = attributedString
        return label
    }()
    
    private let bestDestinationLabel: UILabel = {
        let label = UILabel()
        label.text = "Best Destination"
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    private let viewAllButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("View all", for: .normal)
        button.setTitleColor(.orange, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return button
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: UIConstants.collectionViewItemWidth, height: UIConstants.collectionViewItemHeight)
        layout.minimumLineSpacing = UIConstants.collectionViewItemSpacing
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(FavoritePlaceCell.self, forCellWithReuseIdentifier: "DestinationCell")
        cv.dataSource = self
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()


    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Setup UI
    
    private func setupUI() {
        view.backgroundColor = .white
        
        // Add components to view
        let headerStack = UIStackView(arrangedSubviews: [profileButton, UIView(), notificationButton])
        headerStack.axis = .horizontal
        headerStack.alignment = .center
        headerStack.spacing = 10
        
        let titleStack = UIStackView(arrangedSubviews: [bestDestinationLabel, UIView(), viewAllButton])
        titleStack.axis = .horizontal
        titleStack.spacing = 5

        // Layout
        let mainStack = UIStackView(arrangedSubviews: [headerStack, titleLabel, titleStack, collectionView])
        mainStack.axis = .vertical
        mainStack.spacing = 15
        
        view.addSubview(mainStack)
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            mainStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mainStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            collectionView.heightAnchor.constraint(equalToConstant: UIConstants.collectionViewItemHeight)
        ])
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.places.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DestinationCell", for: indexPath) as? FavoritePlaceCell else {
            return UICollectionViewCell()
        }
        let place = viewModel.places[indexPath.row]
        cell.configure(with: place)
        return cell
    }
}


struct HomeViewControllerPreview: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> HomeViewController {
        return HomeViewController()
    }

    func updateUIViewController(_ uiViewController: HomeViewController, context: Context) {
        // Обновите состояние контроллера, если требуется
    }
}

struct HomeViewController_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewControllerPreview()
            .edgesIgnoringSafeArea(.all) // Убирает отступы в превью
            .previewDevice("iPhone 13") // Укажите устройство для предварительного просмотра
    }
}
