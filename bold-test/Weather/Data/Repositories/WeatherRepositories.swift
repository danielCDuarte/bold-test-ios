//
//  WeatherRepositories.swift
//  bold-test
//
//  Created by Daniel Crespo Duarte on 15/05/23.
//

import Combine
import Foundation

class WeatherRepositories: WeatherRepositoriesType {
    
    private(set) var networkService: NetworkServiceType
    
    init(networkService: NetworkServiceType) {
        self.networkService = networkService
    }
    
    func getCities(by query: String) -> AnyPublisher<[CityObject], Error> {
        let endPoint = NetworkRequest<[APICityResponse]>(
            method: .GET,
            relativePath:DataConstants.WS.search,
            parameters: [
                "key": DataConstants.apikey,
                "q": query
            ]
        )
        
        return networkService.request(endPoint,
                                      queue: .main)
        .map { CitiesMapper.map(input: $0) }
        .eraseToAnyPublisher()
    }
    
    func getForecast(by name: String) -> AnyPublisher<ForecastObject, Error> {
        let endPoint = NetworkRequest<APIForecastResponse>(
            method: .GET,
            relativePath:DataConstants.WS.forecast,
            parameters: [
                "key": DataConstants.apikey,
                "q": name,
                "days": DataConstants.days
            ]
        )
        
        return networkService.request(endPoint,
                                      queue: .main)
        .map { ForecatsMapper.map(input: $0) }
        .eraseToAnyPublisher()
    }
}
