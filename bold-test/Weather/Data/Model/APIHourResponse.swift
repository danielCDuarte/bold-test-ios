//
//  APIHourResponse.swift
//  bold-test
//
//  Created by Daniel Crespo Duarte on 15/05/23.
//

import Foundation

struct APIHourResponse: Codable {
    var time: String
    var tempC: Float
    var condition: APIConditionResponse
    var windKph: Float
    var humidity: Int
    
    init(time: String,
         tempC: Float,
         condition: APIConditionResponse,
         windKph: Float,
         humidity: Int) {
        self.time = time
        self.tempC = tempC
        self.condition = condition
        self.windKph = windKph
        self.humidity = humidity
    }
    
    enum CodingKeys : String, CodingKey {
        case time
        case tempC = "temp_c"
        case condition
        case windKph = "wind_kph"
        case humidity
    }
    
}
