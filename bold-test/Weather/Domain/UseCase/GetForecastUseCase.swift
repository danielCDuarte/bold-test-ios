//
//  GetForecastUseCase.swift
//  bold-test
//
//  Created by Daniel Crespo Duarte on 16/05/23.
//

import Foundation
import Combine

class GetForecastUseCase: AnyUseCase<String, ForecastObject> {
    let repository: WeatherRepositoriesType
    
    init(repository: WeatherRepositoriesType) {
        self.repository = repository
    }
    
    override func execute(params: String) -> AnyPublisher<ForecastObject, Error> {
        return repository.getForecast(by: params)
    }
}
