//
//  ContentView.swift
//  Shared
//
//  Created by Igor Kim on 05.12.21.
//

import SwiftUI

struct ContentView: View {
    // TabView throws warnings otherwise
    @State var selection: Int = 0
    
    var body: some View {
        TabView(selection: $selection) {
            PlayScreen()
                .tag(0)
                .tabItem {
#if !os(watchOS)
                    Image(systemName: "gamecontroller")
#endif
                    Text("Play")
                }
            
            SettingsScreen()
                .tag(1)
                .tabItem {
#if !os(watchOS)
                    Image(systemName: "gear")
#endif
                    Text("Settings")
                }
            
            LeaderboardScreen()
                .tag(2)
                .tabItem {
#if !os(watchOS)
                    Image(systemName: "star")
#endif
                    Text("Leaderboard")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
