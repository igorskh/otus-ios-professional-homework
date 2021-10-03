//
//  NewsScreen.swift
//  otus-ios-homework1
//
//  Created by Igor Kim on 25.08.21.
//

import SwiftUI

struct NewsScreen: View {
    @ObservedObject var news: NewsAPIViewModel = .init()
    @ObservedObject var topics: NewsTopicsViewModel = .init()

    var body: some View {
        NavControllerView {
            VStack  {
                Text("News")
                    .font(.title)
                
                TopicsView()
                    .environmentObject(topics)
                
                NewsListView()
                    .environmentObject(news)
            }
        }
    }
}

struct NewsScreen_Previews: PreviewProvider {
    static var previews: some View {
        NewsScreen()
    }
}
