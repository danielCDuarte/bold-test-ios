//
//  GetCitiesByQueryUseCase.swift
//  bold-test
//
//  Created by Daniel Crespo Duarte on 16/05/23.
//

import Foundation
import Combine

class GetCitiesByQueryUseCase: AnyUseCase<String, [CityObject]> {
    let repository: WeatherRepositoriesType
    
    init(repository: WeatherRepositoriesType) {
        self.repository = repository
    }
    
    override func execute(params: String) -> AnyPublisher<[CityObject], Error> {
        return repository.getCities(by: params)
    }
}
