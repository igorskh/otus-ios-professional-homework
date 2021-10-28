//
//  WeatherScreenViewModel.swift
//  iosAppKMM
//
//  Created by Igor Kim on 28.10.21.
//

import Foundation
import shared

class WeatherScreenViewModel: ObservableObject {
    @Published var locationValue: String = ""
    @Published var errorText: String = ""
    @Published var locations: [Location] = []
    
    private let service: WeatherService = .init()
    
    func searchLocation() {
        errorText = ""
        
        service.searchLocation(locationValue: locationValue) { resp, err in
            if let err = err {
                self.errorText = err.localizedDescription
                return
            }
            
            if let err = resp?.errorText, !err.isEmpty {
                self.errorText = err
                return
            }
            
            self.locations = resp?.locations ?? []
        }
    }
}
