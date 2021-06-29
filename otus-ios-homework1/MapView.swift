//
//  MapView.swift
//  otus-ios-homework1
//
//  Created by Igor Kim on 23.06.21.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    var centerCoordinate: CLLocationCoordinate2D
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.centerCoordinate = centerCoordinate
        return mapView
    }

    func updateUIView(_ view: MKMapView, context: Context) {}
}
