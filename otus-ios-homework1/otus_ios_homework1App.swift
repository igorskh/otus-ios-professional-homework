//
//  otus_ios_homework1App.swift
//  otus-ios-homework1
//
//  Created by Igor Kim on 17.06.21.
//

import SwiftUI

@main
struct otus_ios_homework1App: App {
    init() {
        ServiceLocator.shared.add(
            service: NewsAPIService(token: "86346ae4bf054d819cc1d938a0ba75d7")
        )
        ServiceLocator.shared.add(
            service: NewsTopicsService()
        )
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
