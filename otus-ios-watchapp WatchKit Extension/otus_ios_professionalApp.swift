//
//  otus_ios_professionalApp.swift
//  otus-ios-watchapp WatchKit Extension
//
//  Created by Igor Kim on 05.12.21.
//

import SwiftUI

@main
struct otus_ios_professionalApp: App {
    @ObservedObject var game: GameService = .init()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(game)
        }
    }
}
