//
//  NewsAPIViewController.swift
//  otus-ios-homework1
//
//  Created by Igor Kim on 24.08.21.
//

import Foundation
import Combine
import NewsAPI

class NewsAPIViewModel: ObservableObject {
    @Injected private var newsService: NewsAPIService
    @Injected private var topicsService: NewsTopicsService
    
    private var cancellables: Set<AnyCancellable> = .init()
    
    @Published private(set) var lastError: String = ""
    @Published private(set) var articles: [Article] = .init()
    @Published private(set) var isPageLoading: Bool = false
    @Published private(set) var topics: [String] = []
    
    init() {
        topicsService.$topicIndex.sink { newTopicIndex in
            let newTopic = self.topicsService.topics?[newTopicIndex] ?? ""
            self.setTopic(to: newTopic)
        }
        .store(in: &cancellables)
    }
    
    deinit {
        cancellables.forEach { cancellable in
            cancellable.cancel()
        }
    }
    
    @available(iOS 15.0.0, *)
    func reload() async {
        guard !isPageLoading else {
            return
        }
        newsService.setPage(page: 0)
        
        lastError = ""
        do {
            let articles = try await newsService.loadPage()
            
            DispatchQueue.main.async {
                self.articles = articles
            }
        } catch {
            DispatchQueue.main.async {
                self.lastError = (error as! CustomError).description
            }
        }
    }
    
    func loadPage() {
        guard !isPageLoading else {
            return
        }
        lastError = ""
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
    
    func setTopic(to newTopic: String) {
        if newsService.setTopic(to: newTopic) {
            articles = []
            loadPage()
        }
    }
}
