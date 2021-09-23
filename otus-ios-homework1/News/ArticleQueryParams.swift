//
//  ArticleQueryParams.swift
//  otus-ios-homework1
//
//  Created by Igor Kim on 23.09.21.
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
