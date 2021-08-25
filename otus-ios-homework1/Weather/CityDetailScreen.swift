//
//  CityDetailSCreen.swift
//  otus-ios-homework1
//
//  Created by Igor Kim on 23.06.21.
//

import SwiftUI
import MetaweatherAPI

struct CityDetailScreen: View {
    var location: Location
    
    var body: some View {
        VStack {
            Text(location.title)
            MapView(centerCoordinate: location.coordinates)
                .frame(maxHeight: 250)
            Spacer()
        }
    }
}

struct CityDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        CityDetailScreen(location: Location(title: "Moscow", woeid: 0, locationType: .city, lattLong: "123,123"))
    }
}
