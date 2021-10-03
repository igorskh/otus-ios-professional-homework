//
//  CustomError.swift
//  otus-ios-homework1
//
//  Created by Igor Kim on 23.09.21.
//

import Foundation

struct CustomError: Error, CustomStringConvertible {
    var description: String

    init(description: String) {
        self.description = description
    }
}
