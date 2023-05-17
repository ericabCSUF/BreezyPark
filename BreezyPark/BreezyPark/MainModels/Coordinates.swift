//
//  Coordinates.swift
//  ParkBreezy
//
//  Created by csuftitan on 4/9/23.
//

import Foundation
import MapKit

struct Coordinates: Identifiable {
    let id = UUID()
    let latitude: Double
    let longitude: Double
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

