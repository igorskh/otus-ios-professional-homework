//
//  PlayScreen.swift
//  otus-ios-professional
//
//  Created by Igor Kim on 05.12.21.
//

import SwiftUI

struct GameStepView: View {
    @EnvironmentObject var game: GameService
    
    var body: some View {
        ScrollView {
            Text(game.taskText)
                .font(.title3)
            
            ForEach(game.currentChoices.indices) { i in
                CustomButton(label: "\(game.currentChoices[i])") {
                    game.choiceClicked(choiceID: i)
                }
            }
            
            CustomButton(label: "Stop") {
                game.stop()
            }
            .padding(.vertical, 5)
        }
    }
}

struct PlayScreen: View {
    @EnvironmentObject var game: GameService
    
    var body: some View {
        if game.isRunning {
            GameStepView()
        } else {
            VStack {
                Text("Game")
                    .font(.title)
                    .padding(.vertical)
                
                CustomButton(label: "Play") {
                    game.start()
                }
                
                Spacer()
            }
        }
    }
}

struct PlayScreen_Previews: PreviewProvider {
    static var previews: some View {
        PlayScreen()
    }
}
