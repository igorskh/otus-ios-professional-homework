//
//  Injected.swift
//  otus-ios-homework1
//
//  Created by Igor Kim on 23.09.21.
//

@propertyWrapper
struct Injected<Service> {
    private var service: Service
    
    public init(serviceLocator: ServiceLocator = .shared) {
        self.service = serviceLocator.resolve()
    }
    
    public var wrappedValue: Service {
        get { return service }
        mutating set { service = newValue }
    }
    
    public var projectedValue: Injected<Service> {
        get { return self }
        mutating set { self = newValue }
    }
}
