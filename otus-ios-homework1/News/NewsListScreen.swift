//
//  NewsListScreen.swift
//  otus-ios-homework1
//
//  Created by Igor Kim on 25.08.21.
//

import SwiftUI
import NewsAPI

struct NewsListScreen: View {
    @ObservedObject var news: NewsAPIViewModel = .init()
    @State var showNewTopicForm: Bool = false
    
    var list: some View  {
        List(news.articles) { article  in
            NavPushButton(destination: ArticleDetailView(article: article)) {
                ArticleCellView(article: article)
                    .environmentObject(news)
            }
        }
    }
    
    var topicsView: some View {
        HStack {
            Text("Topic:")
            Picker("Topic", selection: $news.topicIndex) {
                if news.topics.count == 0 {
                   Text("No topics")
                        .tag(-1)
                } else {
                    ForEach(0..<news.topics.count, id: \.self) {
                        Text(news.topics[$0])
                            .tag($0)
                    }
                }
            }
            .disabled(news.topics.count == 0)
            .pickerStyle(DefaultPickerStyle())
            
            Spacer()
            
            Button(action: {
                news.removeTopic(name: news.topics[news.topicIndex])
            }) {
                Image(systemName: "trash.circle")
                    .font(.title3)
            }.disabled(news.topics.count == 0)
            
            Button(action: {
                showNewTopicForm.toggle()
            }) {
                Image(systemName: "plus.circle")
                    .font(.title3)
            }
            .sheet(isPresented: $showNewTopicForm) {
                AddNewTopicView()
                    .environmentObject(news)
            }
        }
        .padding(.horizontal)
    }
    
    var body: some View {
        NavControllerView {
            VStack  {
                Text("News")
                    .font(.title)
                
                topicsView
                
                if news.isPageLoading && news.articles.isEmpty {
                    ProgressView()
                        .scaleEffect(2.0)
                        .padding()
                }
                
                if news.lastError != "" {
                    Text(news.lastError)
                        .foregroundColor(.red)
                }
                
                
                if news.topicIndex < 0 {
                    Text("Select topic")
                        .font(.title3)
                }
                
                if #available(iOS 15.0, *) {
                    list
                        .refreshable {
                            await news.reload()
                        }
                } else {
                    list
                }
            }
        }
    }
}

struct NewsListScreen_Previews: PreviewProvider {
    static var previews: some View {
        NewsListScreen()
    }
}
