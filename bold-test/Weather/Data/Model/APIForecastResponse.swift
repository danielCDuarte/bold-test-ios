//
//  APIForecastResponse.swift
//  bold-test
//
//  Created by Daniel Crespo Duarte on 15/05/23.
//

import Foundation

struct APIForecastResponse: Codable {
    var location: APILocationResponse
    var current: APICurrentResponse
    var forecast: APIForecastDaysResponse
    
    init(location: APILocationResponse,
         current: APICurrentResponse,
         forecast: APIForecastDaysResponse) {
        self.location = location
        self.current = current
        self.forecast = forecast
    }
}
