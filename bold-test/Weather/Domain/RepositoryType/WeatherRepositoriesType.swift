//
//  WeatherRepositoriesType.swift
//  bold-test
//
//  Created by Daniel Crespo Duarte on 16/05/23.
//

import Combine
import Foundation

protocol WeatherRepositoriesType {
    func getCities(by query: String) -> AnyPublisher<[CityObject], Error>
    func getForecast(by name: String) -> AnyPublisher<ForecastObject, Error>
}
