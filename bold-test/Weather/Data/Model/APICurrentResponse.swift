//
//  APICurrentResponse.swift
//  bold-test
//
//  Created by Daniel Crespo Duarte on 15/05/23.
//

import Foundation

struct APICurrentResponse: Codable {
    var tempC: Float
    var condition: APIConditionResponse
    var windKph: Float
    var humidity: Int
    var cloud: Int
    var visKm: Float
    var gustKph: Float
    
    init(tempC: Float,
         condition: APIConditionResponse,
         windKph: Float,
         humidity: Int,
         cloud: Int,
         visKm: Float,
         gustKph: Float) {
        self.tempC = tempC
        self.condition = condition
        self.windKph = windKph
        self.humidity = humidity
        self.cloud = cloud
        self.visKm = visKm
        self.gustKph = gustKph
    }
    
    enum CodingKeys : String, CodingKey {
        case tempC = "temp_c"
        case condition
        case windKph = "wind_kph"
        case humidity
        case cloud
        case visKm = "vis_km"
        case gustKph = "gust_kph"
    }
}
