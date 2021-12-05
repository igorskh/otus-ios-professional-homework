//
//  LeaderboardScreen\.swift
//  otus-ios-professional
//
//  Created by Igor Kim on 05.12.21.
//

import SwiftUI

struct LeaderboardScreen: View {
    @EnvironmentObject var game: GameService
    
    var body: some View {
        ScrollView {
            Text("History")
                .font(.title)
                .padding(.vertical)
            
            ForEach(game.leaderboard.reversed()) {
                Text("Score: \($0.score)")
            }
        }
        
    }
}

struct LeaderboardScreen_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardScreen()
    }
}
