//
//  CityListScreen.swift
//  otus-ios-homework1
//
//  Created by Igor Kim on 17.06.21.
//

import SwiftUI

struct CityListScreen: View {
    @EnvironmentObject var router: Router
    @EnvironmentObject var metaWeather: MetaWeatherViewController

    var body: some View {
        NavigationView {
            VStack {
                TextField("Search Query", text: $metaWeather.searchQuery)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                if (metaWeather.locations.isEmpty) {
                    Text("Nothing found")
                }
                List {
                    ForEach(metaWeather.locations) { item in
                        NavigationLink(
                            destination: CityDetailScreen(location: item),
                            tag: item.woeid,
                            selection: $router.locationWoeid
                        ) {
                            Text("\(item.title)")
                        }
                    }
                }
            }
            .navigationBarTitle("Cities")
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .onDisappear {
            router.locationWoeid = nil
        }
    }
}

struct CityListScreen_Previews: PreviewProvider {
    static var previews: some View {
        CityListScreen()
    }
}
