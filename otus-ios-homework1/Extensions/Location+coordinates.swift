//
//  Location+coordinates.swift
//  otus-ios-homework1
//
//  Created by Igor Kim on 24.06.21.
//

import Foundation
import MetaweatherAPI
import CoreLocation

extension Location {
    var coordinates: CLLocationCoordinate2D {
        let coords = lattLong.split(separator: ",")
        return CLLocationCoordinate2D(latitude: Double(coords[0]) ?? 0, longitude: Double(coords[1]) ?? 0)
    }
}
