//
//  Location+Identifiable.swift
//  otus-ios-homework1
//
//  Created by Igor Kim on 24.06.21.
//

import Foundation
import MetaweatherAPI

extension Location: Identifiable {
    public var id: Int { woeid }
}
