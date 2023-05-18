//
//  GetCitiesByQueryUseCaseStub.swift
//  bold-testTests
//
//  Created by Daniel Crespo Duarte on 17/05/23.
//

import Combine
import Foundation
@testable import bold_test

class GetCitiesByQueryUseCaseStub: AnyUseCase<String, [CityObject]> {
    
    static var cities = [TestDomainConstants.emptyCity]
    
    static var error: Error?
    
    override func execute(params: String) -> AnyPublisher<[CityObject], Error> {
        let publisher = CurrentValueSubject<[CityObject], Error>(GetCitiesByQueryUseCaseStub.cities)
        if let error = GetCitiesByQueryUseCaseStub.error {
            publisher.send(completion: .failure(error))
        }
        return publisher.eraseToAnyPublisher()
    }
}
