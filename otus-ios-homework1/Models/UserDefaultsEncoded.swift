//
//  UserDefaultsEncoded.swift
//  otus-ios-homework1
//
//  Created by Igor Kim on 24.09.21.
//

import Foundation

@propertyWrapper
struct UserDefaultsEncoded<Value:Codable> {
    private var value: Value?
    private var key: String
    private var storage: UserDefaults
    
    init(key: String, storage: UserDefaults = .standard) {
        self.storage = storage
        self.key = key
        
        self.value = nil
        if let savedValue = storage.object(forKey: key) as? Data {
            let decoder = JSONDecoder()
            self.value = try? decoder.decode(Value.self, from: savedValue)
        }
    }
    
    var wrappedValue: Value? {
        get {
            value
        }
        mutating set {
            value = newValue
            guard let value = value else {
                return
            }
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(value) {
                storage.set(encoded, forKey: key)
            }
        }
    }
}
