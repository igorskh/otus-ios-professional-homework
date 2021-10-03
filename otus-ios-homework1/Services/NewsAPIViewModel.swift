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
    @Published var topicIndex: Int = -1 {
        didSet {
            if topicIndex < 0 || topicIndex >= topics.count  {
                setTopic(to: "")
                return
            }
            setTopic(to: topics[topicIndex])
            topicsService.topicIndex = topicIndex
        }
    }
    
    @available(iOS 15.0.0, *)
    func reload() async {
        guard !isPageLoading && topicIndex >= 0 else {
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
        guard !isPageLoading && topicIndex >= 0 else {
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
    
    init() {
        topicsService.$topics.sink { newTopics in
            guard let newTopics = newTopics else {
                return
            }
            self.topics = newTopics
            
            if self.topicIndex < 0 {
                self.topicIndex = self.topicsService.topicIndex
                
                if newTopics.isEmpty {
                    self.addTopic(name: "WWDC")
                }
            }
        }
        .store(in: &cancellables)
    }
    
    deinit {
        cancellables.forEach { cancellable in
            cancellable.cancel()
        }
    }
    
    func addTopic(name: String) {
        let index = topicsService.addTopic(name: name)
        
        DispatchQueue.main.async {
            self.topicIndex = index
        }
    }
    
    func removeTopic(name: String) {
        topicsService.removeTopic(name: name)
        
        topicIndex = topics.count - 1
    }
    
    func setTopic(to newTopic: String) {
        if newsService.setTopic(to: newTopic) {
            articles = []
            loadPage()
        }
    }
}
