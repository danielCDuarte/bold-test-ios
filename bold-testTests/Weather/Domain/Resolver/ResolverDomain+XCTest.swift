//
//  ResolverDomain+XCTest.swift
//  bold-testTests
//
//  Created by Daniel Crespo Duarte on 17/05/23.
//

import Foundation
import Resolver
@testable import bold_test

extension Resolver  {
    static var mock = Resolver(child: .main)
    
    static func registerDomainMockServices() {
        root = Resolver.mock
        defaultScope = .application
        mock.register { WeatherRepositoriesStub() }
            .implements(WeatherRepositoriesType.self)
        
    }
    
}
