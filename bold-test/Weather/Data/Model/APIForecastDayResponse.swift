//
//  APIForecastDayResponse.swift
//  bold-test
//
//  Created by Daniel Crespo Duarte on 15/05/23.
//

import Foundation

struct APIForecastDayResponse: Codable {
    var date: String
    var day: APIDayResponse
    var hour: [APIHourResponse]
    
    init(date: String,
         day: APIDayResponse,
         hour: [APIHourResponse]) {
        self.date = date
        self.day = day
        self.hour = hour
    }
    
}
