//
//  NewsAPIViewController.swift
//  otus-ios-homework1
//
//  Created by Igor Kim on 24.08.21.
//

import Foundation
import NewsAPI

struct ArticleQueryParams {
    var query: String
    var fromDate: Date?
    var toDate: Date?
    var sortBy: ArticleSort
    var language: String?
}

class NewsAPIViewModel: ObservableObject {
    static var newsApiToken = "86346ae4bf054d819cc1d938a0ba75d7"
    
    @Published private(set) var lastError: String = ""
    @Published private(set) var articles: [Article] = .init()
    @Published private(set) var isPageLoading: Bool = false
    private(set) var queryParams: ArticleQueryParams = .init(
        query: "WWDC",
        sortBy: ArticleSort.publishedat,
        language: "en"
    ) {
        didSet {
            page = 0
            articles.removeAll()
            loadPage()
        }
    }
    private(set) var pageSize: Int = 10
    private(set) var page: Int = 0
    
    init() {
        loadPage()
    }
    
    func setTopic(to newTopic: String) {
        guard queryParams.query != newTopic else {
            return
        }
        queryParams.query = newTopic
    }
    
    func loadPage() {
        guard isPageLoading == false else {
            return
        }
        lastError = ""
        isPageLoading = true
        page += 1
        NewsAPI.everythingGet(q: queryParams.query,
                              sortBy: queryParams.sortBy,
                              apiKey: NewsAPIViewModel.newsApiToken,
                              from: queryParams.fromDate,
                              to: queryParams.toDate,
                              language: queryParams.language,
                              page: page,
                              pageSize: pageSize) { list, error in
            defer {
                self.isPageLoading = false
            }
            if let error = error {
                
                if  case let .error(status, _, _, error) = error as? ErrorResponse {
                    self.lastError = "\(status) \(error)"
                } else {
                    self.lastError = error.localizedDescription
                }
                return
            }
            
            if list?.status != "ok" {
                self.lastError = "Could not load news"
                return
            }
            
            let displayArticles = list?.articles?.filter { article in
                article.title != nil
            } ?? []
            
            self.articles.append(contentsOf: displayArticles)
        }
    }
    
}
