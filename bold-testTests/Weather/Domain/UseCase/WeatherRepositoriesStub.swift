//
//  WeatherRepositoriesStub.swift
//  bold-testTests
//
//  Created by Daniel Crespo Duarte on 17/05/23.
//

import Combine
@testable import bold_test

final class WeatherRepositoriesStub {
    static var error: Error?
    static var responseCities: [CityObject]!
    static var responseForecast: ForecastObject!
}

extension WeatherRepositoriesStub: WeatherRepositoriesType {
    func getCities(by query: String) -> AnyPublisher<[bold_test.CityObject], Error> {
        let data = WeatherRepositoriesStub.responseCities ?? []
        let publisher = CurrentValueSubject<[CityObject], Error>(data)
        
        if let error = WeatherRepositoriesStub.error {
            publisher.send(completion: .failure(error))
        }
        return publisher.eraseToAnyPublisher()
    }
    
    func getForecast(by name: String) -> AnyPublisher<bold_test.ForecastObject, Error> {
        let data = WeatherRepositoriesStub.responseForecast ?? TestDomainConstants.emptyforecast
        
        let publisher = CurrentValueSubject<ForecastObject, Error>(data)
        
        if let error = WeatherRepositoriesStub.error {
            publisher.send(completion: .failure(error))
        }
        return publisher.eraseToAnyPublisher()
    }
    
}
