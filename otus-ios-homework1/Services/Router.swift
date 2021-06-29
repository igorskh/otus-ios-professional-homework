//
//  Router.swift
//  otus-ios-homework1
//
//  Created by Igor Kim on 17.06.21.
//

import Foundation

final class Router: ObservableObject {
    @Published var tabSelection: Int = 0
    @Published var locationWoeid: Int?
}
