//
//  SuffixSequence.swift
//  otus-ios-homework
//
//  Created by Igor Kim on 03.10.21.
//

import Foundation

struct SuffixSequence: Sequence {
    let string: String
    
    func makeIterator() -> SuffixIterator {
        return SuffixIterator(string: string)
    }
}

struct SuffixIterator: IteratorProtocol {
    let string: String
    var offset: Int = 0
    
    mutating func next() -> Substring? {
        guard offset < string.count else { return nil }
        offset += 1
        return string.suffix(offset)
    }
}
