//
//  MapViewController.swift
//  SunaTravel
//
//  Created by salfetka on 08.01.2025.
//

import UIKit
import SwiftUI
import YandexMapsMobile

class MapViewController: UIViewController, YMKLayersGeoObjectTapListener {
    func onObjectTap(with event: YMKGeoObjectTapEvent) -> Bool {
        let geoObject = event.geoObject
        
        if let name = geoObject.name {
            print("Tapped on: \(name)")
        } else {
            print("Tapped on an unnamed object")
        }

        return true
    }

    private var mapView: YMKMapView!
    private let viewModel = MapViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupMapView()
        setupMarkers()
    }

    private func setupMapView() {
        mapView = YMKMapView(frame: view.bounds)
        view.addSubview(mapView)

        let initialLocation = YMKPoint(latitude: 55.751244, longitude: 37.618423)
        mapView.mapWindow.map.move(
            with: YMKCameraPosition(target: initialLocation, zoom: 2, azimuth: 0, tilt: 0),
            animation: YMKAnimation(type: .smooth, duration: 5),
            cameraCallback: nil
        )

        mapView.mapWindow.map.addInputListener(with: self)
        mapView.mapWindow.map.mapObjects.addTapListener(with: self)
    }

    private func setupMarkers() {
        viewModel.createCityMarkers(mapView.mapWindow.map)
    }
}

// MARK: - Listener
extension MapViewController: YMKMapInputListener {
    func onMapTap(with map: YMKMap, point: YMKPoint) {
        
    }

    func onMapLongTap(with map: YMKMap, point: YMKPoint) {
        let alert = UIAlertController(title: "Add Marker", message: "Enter a name for the marker", preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "Marker name"
        }
        let addAction = UIAlertAction(title: "Add", style: .default) { [weak self] _ in
            guard let self = self else { return }
            let name = alert.textFields?.first?.text ?? "Unnamed Marker"
            self.viewModel.addPlace(at: point, with: name, on: map) // Передаем карту
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

        alert.addAction(addAction)
        alert.addAction(cancelAction)

        present(alert, animated: true, completion: nil)
    }
}

extension MapViewController: YMKMapObjectTapListener {
    func onMapObjectTap(with mapObject: YMKMapObject, point: YMKPoint) -> Bool {
        guard let placemark = mapObject as? YMKPlacemarkMapObject,
              let userData = placemark.userData as? [String: Any],
              let name = userData["name"] as? String,
              let latitude = userData["latitude"] as? Double,
              let longitude = userData["longitude"] as? Double else {
            return false
        }

        let alert = UIAlertController(
            title: name,
            message: "Coordinates:\nLatitude: \(latitude)\nLongitude: \(longitude)",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)

        return true
    }
}


// MARK: - Preview
struct MapViewControllerPreview: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> MapViewController {
        YMKMapKit.setApiKey("98c7692d-3ebf-4c47-abe7-34663a0e4677")
        YMKMapKit.sharedInstance().onStart()
        return MapViewController()
    }

    func updateUIViewController(_ uiViewController: MapViewController, context: Context) {}
}

struct PopularCitiesMapViewController_Previews: PreviewProvider {
    static var previews: some View {
        MapViewControllerPreview()
            .edgesIgnoringSafeArea(.all)
            .previewDevice("iPhone 13")
    }
}
