//
//  NewsAPIViewController.swift
//  otus-ios-homework1
//
//  Created by Igor Kim on 24.08.21.
//

import Foundation
import NewsAPI

class NewsAPIViewModel: ObservableObject {
    @Injected private var newsService: NewsAPIService
    
    @Published private(set) var lastError: String = ""
    @Published private(set) var articles: [Article] = .init()
    @Published private(set) var isPageLoading: Bool = false
    
    init() {
        loadPage()
    }
    
    func setTopic(to newTopic: String) {
        articles = []
        
        newsService.setTopic(to: newTopic)
        loadPage()
    }
    
    func loadPage() {
        guard !isPageLoading else {
            return
        }
        isPageLoading = true
        
        newsService.loadPage { result in
            switch result {
            case .success(let articles):
                self.articles.append(contentsOf: articles)
            case .failure(let error):
                self.lastError = error.description
            }
            self.isPageLoading = false
        }
    }
}
