//
//  NewsAPIService.swift
//  otus-ios-homework1
//
//  Created by Igor Kim on 23.09.21.
//

import NewsAPI

class NewsAPIService {
    private var queryParams: ArticleQueryParams = .init(
        query: "WWDC",
        sortBy: ArticleSort.publishedat,
        language: "en"
    )
    private var pageSize: Int = 10
    private var page: Int = 0
    private var apiToken: String
    
    init(token: String) {
        apiToken = token
    }
    
    func setTopic(to newTopic: String) {
        guard queryParams.query != newTopic else {
            return
        }
        queryParams.query = newTopic
        
        page = 0
    }
    
    func loadPage(onResult: @escaping (Result<[Article], CustomError>) -> Void) {
        page += 1
        NewsAPI.everythingGet(q: queryParams.query,
                              sortBy: queryParams.sortBy,
                              apiKey: apiToken,
                              from: queryParams.fromDate,
                              to: queryParams.toDate,
                              language: queryParams.language,
                              page: page,
                              pageSize: pageSize) { list, error in
            if let error = error {
                
                if  case let .error(status, _, _, error) = error as? ErrorResponse {
                    onResult(.failure(
                        CustomError(description: "\(status) \(error)")
                    ))
                } else {
                    onResult(.failure(
                        CustomError(description: error.localizedDescription)
                    ))
                }
                return
            }
            
            if list?.status != "ok" {
                return onResult(.failure(
                    CustomError(description: "Could not load news")
                ))
            }
            
            let displayArticles = list?.articles?.filter { article in
                article.title != nil
            } ?? []
            
            onResult(.success(displayArticles))
        }
    }
}
