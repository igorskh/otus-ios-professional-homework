//
//  MetaWeatherViewController.swift
//  otus-ios-homework1
//
//  Created by Igor Kim on 23.06.21.
//

import Foundation
import Networking

class MetaWeatherViewController: ObservableObject {
    @Published var locations: [Location] = []
    @Published var searchQuery: String = "" {
        didSet {
            if searchQuery.count > 1 {
                searchLocation(query: searchQuery)
            }
        }
    }
    
    func searchLocation(query: String) {
        WeatherSearchAPI.weatherSearch(query: query) { locations, error in
            self.locations = locations ?? []
        }
    }
}
