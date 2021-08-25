//
//  NewsListScreen.swift
//  otus-ios-homework1
//
//  Created by Igor Kim on 25.08.21.
//

import SwiftUI
import NewsAPI

struct TopicChoice {
    var topic: String
}

let topics = [
    TopicChoice(topic: "WWDC"),
    TopicChoice(topic: "Food"),
    TopicChoice(topic: "Health")
]

struct NewsListScreen: View {
    @EnvironmentObject var news: NewsAPIViewModel
    @State var topic: Int = 0
    
    var list: some View  {
        List(news.articles) { article  in
            NavPushButton(destination: ArticleDetailView(article: article)) {
                ArticleCellView(article: article)
                    .environmentObject(news)
            }
        }
    }
    
    var body: some View {
        NavControllerView {
            VStack  {
                Text("News")
                    .font(.title)
                Picker("Topic", selection: $topic) {
                    ForEach(0..<topics.count, id: \.self) {
                        Text(topics[$0].topic)
                            .tag($0)
                    }
                    .onChange(of: topic) {
                        news.setTopic(to: topics[$0].topic)
                    }
                }.pickerStyle(SegmentedPickerStyle())
                
                if news.isPageLoading && news.articles.isEmpty {
                    ProgressView()
                        .scaleEffect(2.0)
                        .padding()
                }
                
                if news.lastError != "" {
                    Text(news.lastError)
                }
                
                list
            }
        }
    }
}

struct NewsListScreen_Previews: PreviewProvider {
    static var previews: some View {
        NewsListScreen()
    }
}
