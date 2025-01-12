import Foundation
import YandexMapsMobile

class MapViewModel {
    private(set) var cities: [MapPlace] = [
        MapPlace(name: "Niladri Reservoir", latitude: 25.20000000, longitude: 91.17000000),
        MapPlace(name: "Casa Las Tirtugas", latitude: 21.525768, longitude: -87.377867),
        MapPlace(name: "Aonang Villa Resort", latitude: 8.030919, longitude: 98.822458),
        MapPlace(name: "Rangauti Resort", latitude: 24.500192, longitude: 91.798625),
        MapPlace(name: "Kachura Resort", latitude: 35.446777, longitude: 75.445754),
        MapPlace(name: "Shakardu Resort", latitude: 35.464407, longitude: 75.663530)
    ]

    func createCityMarkers(_ map: YMKMap) {
        for city in cities {
            addPlacemark(map, for: city)
        }
    }

    func addPlace(at point: YMKPoint, with name: String, on map: YMKMap) {
        let newPlace = MapPlace(name: name, latitude: point.latitude, longitude: point.longitude)
        cities.append(newPlace)
        addPlacemark(map, for: newPlace)
    }

    private func addPlacemark(_ map: YMKMap, for place: MapPlace) {
        let placemark = map.mapObjects.addPlacemark()
        placemark.geometry = YMKPoint(latitude: place.latitude, longitude: place.longitude)
        placemark.setIconWith(UIImage(systemName: "mappin.circle.fill")!)
        placemark.userData = ["name": place.name, "latitude": place.latitude, "longitude": place.longitude]
    }
}
