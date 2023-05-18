//
//  GetForecastUseCaseStub.swift
//  bold-testTests
//
//  Created by Daniel Crespo Duarte on 17/05/23.
//

import Combine
import Foundation
@testable import bold_test

class GetForecastUseCaseStub: AnyUseCase<String, ForecastObject> {
    
    static var forecast = TestDomainConstants.emptyforecast
    static var error: Error?
    
    override func execute(params: String) -> AnyPublisher<ForecastObject, Error> {
        let publisher = CurrentValueSubject<ForecastObject, Error>(GetForecastUseCaseStub.forecast)
        if let error = GetForecastUseCaseStub.error {
            publisher.send(completion: .failure(error))
        }
        return publisher.eraseToAnyPublisher()
    }
}
