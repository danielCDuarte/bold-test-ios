//
//  APIForecastDaysResponse.swift
//  bold-test
//
//  Created by Daniel Crespo Duarte on 15/05/23.
//

import Foundation

struct APIForecastDaysResponse: Codable {
    var forecastday: [APIForecastDayResponse]
    
    init(forecastday: [APIForecastDayResponse]) {
        self.forecastday = forecastday
    }
}

