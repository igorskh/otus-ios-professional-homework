//
//  NewsListView.swift
//  otus-ios-homework1
//
//  Created by Igor Kim on 03.10.21.
//

import SwiftUI

struct NewsListView: View {
    @EnvironmentObject var news: NewsAPIViewModel
    
    var list: some View  {
        List(news.articles) { article  in
            NavPushButton(destination: ArticleDetailView(article: article)) {
                ArticleCellView(article: article)
                    .environmentObject(news)
            }
        }
    }
    
    var body: some View {
        VStack {
            if news.isPageLoading && news.articles.isEmpty {
                ProgressView()
                    .scaleEffect(2.0)
                    .padding()
            }
            
            if news.lastError != "" {
                Text(news.lastError)
                    .foregroundColor(.red)
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


struct NewsListView_Previews: PreviewProvider {
    static var previews: some View {
        NewsListView()
    }
}
