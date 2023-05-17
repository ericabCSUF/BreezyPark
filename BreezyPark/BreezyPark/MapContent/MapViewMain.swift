//
//  MapViewMain.swift
//  ParkBreezy
//
//
//

import Foundation
import MapKit

class MapViewMain: ObservableObject {

    @Published var region = MKCoordinateRegion()
    @Published var coordinates: [Coordinates] = []
    @Published var s = ""
    
    func getPlace(from address: AddressCheck) {
        let request = MKLocalSearch.Request()
        let title = address.title
        let subTitle = address.subtitle
        
        request.naturalLanguageQuery = subTitle.contains(title)
        ? subTitle : title + ", " + subTitle
        let addressstring = "\(title)\n\(subTitle) "
        let string = String(describing:addressstring)
        s = string
        Task {
            let response = try await MKLocalSearch(request: request).start()
            await MainActor.run {
                self.coordinates = response.mapItems.map {
                    Coordinates(
                        latitude: $0.placemark.coordinate.latitude,
                        longitude: $0.placemark.coordinate.longitude
                    )
                }
                self.region = response.boundingRegion
            }
        }
    }
}

