//
//  ResolverPresentation+XCTest.swift
//  bold-testTests
//
//  Created by Daniel Crespo Duarte on 17/05/23.
//

import Foundation
import Resolver
@testable import bold_test

extension Resolver  {
    static func registerPresentationMockServices() {
        root = Resolver.mock
        defaultScope = .application
        
        mock.register {
            GetCitiesByQueryUseCaseStub()
        }.implements( AnyUseCase<String, [CityObject]>.self)
        
        mock.register {
            GetForecastUseCaseStub()
        }.implements( AnyUseCase<String, ForecastObject>.self)
        
    }
    
}
