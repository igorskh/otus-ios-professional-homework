//
//  ContentView.swift
//  otus-ios-homework
//
//  Created by Igor Kim on 03.10.21.
//

import SwiftUI


struct ContentView: View {
    @ObservedObject var suffixCounter: SuffixCounterService = .init()
    
    @State var selectedTab = 0
    
    
    var body: some View {
        TabView(selection: $selectedTab) {
            AddWordScreen()
                .environmentObject(suffixCounter)
                .tabItem {
                    Image(systemName: "text.badge.plus")
                    Text("Words")
                }
                .tag(0)
            
            StatsScreen()
                .environmentObject(suffixCounter)
                .tabItem {
                    Image(systemName: "chart.bar.xaxis")
                    Text("Counts")
                }
                .tag(1)
        }
        .onOpenURL {
            print($0)
            switch $0.absoluteString {
            case "stats":
                selectedTab = 1
            default:
                selectedTab = 0
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
