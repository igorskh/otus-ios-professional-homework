//
//  ContentView.swift
//  otus-ios-homework1
//
//  Created by Igor Kim on 17.06.21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var router: Router
    
    var body: some View {
        TabView(selection: $router.tabSelection) {
            NowScreen()
                .tabItem {
                    Image(systemName: "sun.min")
                    Text("Now")
                }
                .tag(0)
            
            CityListScreen()
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Cities")
                }
                .tag(1)
            
            AboutScreen()
                .tabItem {
                    Image(systemName: "info.circle")
                    Text("About")
                }
                .tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
