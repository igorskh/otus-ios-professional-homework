//
//  NewsBookmarkService.swift
//  otus-ios-homework1
//
//  Created by Igor Kim on 24.09.21.
//

import Foundation

class NewsTopicsService {
    @UserDefaultsEncoded(key: "topics")
    private var storedTopics: [String]?
    
    @UserDefaultsEncoded(key: "topicIndex")
    private var storedTopicIndex: Int?
    
    var topics: [String]? {
        didSet {
            storedTopics = topics
        }
    }
    
    @Published public var topicIndex: Int = 0 {
        didSet {
            storedTopicIndex = topicIndex
        }
    }
    
    init() {
        topicIndex = storedTopicIndex ?? 0
        topics = storedTopics ?? []
    }
}
