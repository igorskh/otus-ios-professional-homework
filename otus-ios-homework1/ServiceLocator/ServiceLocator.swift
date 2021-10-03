//
//  ServiceLocator.swift
//  otus-ios-homework1
//
//  Created by Igor Kim on 23.09.21.
//

class ServiceLocator {
    static let shared = ServiceLocator()
    
    private var services: [String:Any] = .init()

    func add<T>(service: T) {
        let key = "\(T.self)"
        services[key] = service
    }

    func resolve<T>() -> T {
        guard let resolvedService: T = lookup() else {
            fatalError("Could not resolve \(T.self)")
        }
        return resolvedService
    }
    
    func lookup<T>() -> T? {
        let key = "\(T.self)"
        return services[key] as? T
    }
}
