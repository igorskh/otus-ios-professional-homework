//
//  Article+Identifiable.swift
//  otus-ios-homework1
//
//  Created by Igor Kim on 25.08.21.
//

import Foundation
import NewsAPI

extension Article: Identifiable {
    public var id: String { return  url }
}


