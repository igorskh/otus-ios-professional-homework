//
//  NewsBookmarkService.swift
//  otus-ios-homework1
//
//  Created by Igor Kim on 24.09.21.
//

import Foundation

class NewsTopicsService {
    @UserDefaultsEncoded(key: "topics")
    private var storedTopics: [String]? {
        didSet {
            topics = storedTopics ?? []
        }
    }
    
    @UserDefaultsEncoded(key: "topicIndex")
    private var storedTopicIndex: Int?
    
    @Published public var topics: [String]?
    public var topicIndex: Int {
        get {
            storedTopicIndex ?? 0
        }
        set {
            storedTopicIndex = newValue
        }
    }
    
    init() {
        topics = storedTopics ?? []
    }
    
    public func addTopic(name: String) -> Int {
        var topics = storedTopics ?? []
        
        if let index = topics.firstIndex(of: name) {
            return index
        }
        
        topics.append(name)
        storedTopics = topics
        return topics.count - 1
    }
    
    public func removeTopic(name: String) {
        var topics = storedTopics ?? []
        
        topics.removeAll { value in
            value == name
        }
        storedTopics = topics
    }
}
