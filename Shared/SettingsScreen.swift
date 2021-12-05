//
//  SettingsScreen.swift
//  otus-ios-professional
//
//  Created by Igor Kim on 05.12.21.
//

import SwiftUI

struct SettingsScreen: View {
    @EnvironmentObject var game: GameService
    
    var body: some View {
        VStack {
            Text("Settings")
                .font(.title)
                .padding(.vertical)
            
            Text("Choose number of steps")
            Picker("Number of steps", selection: $game.numberOfSteps) {
                ForEach(2 ..< 5) {
                    Text("\($0) steps")
                        .tag($0)
                }
            }
            
            Spacer()
        }
    }
}

struct SettingsScreen_Previews: PreviewProvider {
    static var previews: some View {
        SettingsScreen()
    }
}
