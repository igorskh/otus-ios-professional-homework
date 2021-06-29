//
//  NowScreen.swift
//  otus-ios-homework1
//
//  Created by Igor Kim on 17.06.21.
//

import SwiftUI

struct NowScreen: View {
    @EnvironmentObject var router: Router
    @EnvironmentObject var metaWeather: MetaWeatherViewController
    
    var body: some View {
        NavigationView {
            ZStack {
                if metaWeather.locations.count > 0 {
                    Button {
                        router.locationWoeid = metaWeather.locations.randomElement()?.woeid
                        router.tabSelection = 1
                    } label: {
                        Text("Show Random Item")
                    }
                } else {
                    ProgressView()
                }
            }
            Spacer()
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .onAppear {
            if metaWeather.searchQuery == "" {
                metaWeather.searchQuery = "mo"
            }
        }
    }
}

struct NowScreen_Previews: PreviewProvider {
    static var previews: some View {
        NowScreen()
    }
}
