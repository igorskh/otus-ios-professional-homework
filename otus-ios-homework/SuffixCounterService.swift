//
//  SuffixCounterService.swift
//  otus-ios-homework
//
//  Created by Igor Kim on 13.10.21.
//

import Foundation
import WidgetKit

enum ListType {
    case alphabetic
    case top
}

enum SortType {
    case alphabetic
    case count
}

enum SortDirection {
    case asc
    case desc
}

func compare<T: Comparable>(_ a: T, _ b: T, reversed: Bool = false) -> Bool {
    if reversed {
        return b > a
    }
    return a > b
}

class SuffixCounterService: ObservableObject {
    static let suiteName = "group.one.beagile.otus-homework"
    
    @Published private(set) var words: [String] = []
    @Published private(set) var suffixCounts: [String:Int] = [:] {
        didSet {
            updateSharedData()
        }
    }
    @Published private(set) var suffixSorted: [String] = []
    
    @Published var listType: ListType = .alphabetic {
        didSet {
            switch listType {
            case .alphabetic:
                limit = -1
                sortType = .alphabetic
            case .top:
                limit = 10
                sortType = .count
                sortDirection = .desc
            }
        }
    }
    @Published var sortDirection: SortDirection = .asc {
        didSet {
            buildSorted()
        }
    }
    
    
    private var sortType: SortType = .alphabetic {
        didSet {
            buildSorted()
        }
    }
    
    private var limit: Int = -1
    private var minPrefixLength: Int = 3
    
    private func updateSharedData() {
        let topSuffix = buildSorted(type: .count, direction: .desc, limit: 5).map {
            SuffixCount(suffix: $0.key, count: $0.value)
        }
        
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(topSuffix) {
            UserDefaults(suiteName: SuffixCounterService.suiteName)?.set(encoded, forKey: "count")
            WidgetCenter.shared.reloadAllTimelines()
        }
        
    }
    
    func addWord(_ word: String) {
        let newWord = word.lowercased()
        guard !words.contains(newWord), !newWord.isEmpty else {
            return
        }
        words.append(newWord)
        buildSuffixArray(text: newWord)
    }
    
    func removeWord(at index: Int) -> String {
        return words.remove(at: index)
    }
    
    func removeWord(at offsets: IndexSet) {
        if let index = offsets.first {
            buildSuffixArray(text: removeWord(at: index), remove: true)
        }
    }
    
    func buildAdd(suffix: String) {
        if !suffixCounts.keys.contains(suffix) {
            suffixCounts[suffix] = 0
        }
        suffixCounts[suffix]! += 1
    }
    
    func buildRemove(suffix: String) {
        guard suffixCounts.keys.contains(suffix) else {
            return
        }
        
        suffixCounts[suffix]! -= 1
        if suffixCounts[suffix] == 0 {
            suffixCounts.removeValue(forKey: suffix)
        }
    }
    
    func buildSuffixArray(text: String, remove: Bool = false) {
        SuffixSequence(string: text).forEach {
            guard $0.count >= minPrefixLength else {
                return
            }
            let suffix = String($0)
            
            if remove {
                buildRemove(suffix: suffix)
            } else {
                buildAdd(suffix: suffix)
            }
            
        }
        
        buildSorted()
    }
    
    func buildSorted(type: SortType, direction: SortDirection = .asc, limit: Int = -1) -> [Dictionary<String, Int>.Element] {
        let sorted = suffixCounts.sorted {
            if type == .alphabetic {
                return compare($0.key, $1.key, reversed: direction == .asc)
            } else {
                return compare($0.value, $1.value, reversed: direction == .asc)
            }
        }
        let lastIndex = limit > -1 ? min(limit, sorted.count) : sorted.count
        let limited = sorted[0..<lastIndex]
        
        return Array(limited)
    }
     
    func buildSorted() {
        suffixSorted = buildSorted(type: sortType, direction: sortDirection, limit: limit).map {
            $0.key
        }
    }
}
