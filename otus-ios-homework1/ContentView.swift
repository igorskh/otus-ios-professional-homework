//
//  ContentView.swift
//  otus-ios-homework1
//
//  Created by Igor Kim on 17.06.21.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            NewsListScreen()
                .tabItem {
                    Image(systemName: "newspaper")
                    Text("News")
                }
                .tag(2)
            
            AboutScreen()
                .tabItem {
                    Image(systemName: "info.circle")
                    Text("About")
                }
                .tag(3)
        }
        .onAppear {
            // https://www.reddit.com/r/SwiftUI/comments/p8obef/comment/hdqjc0a/
            if #available(iOS 15.0, *) {
                let appearance = UITabBarAppearance()
                UITabBar.appearance().scrollEdgeAppearance = appearance
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
