//
//  CurrentObject.swift
//  bold-test
//
//  Created by Daniel Crespo Duarte on 16/05/23.
//

import Foundation

struct CurrentObject: Identifiable {
    let id = UUID()
    var tempC: String
    var condition: ConditionObject
    var windKph: String
    var humidity: String
    var cloud: String
    var visKm: String
    var gustKph: String
    
    init(tempC: String,
         condition: ConditionObject,
         windKph: String,
         humidity: String,
         cloud: String,
         visKm: String,
         gustKph: String) {
        self.tempC = tempC
        self.condition = condition
        self.windKph = windKph
        self.humidity = humidity
        self.cloud = cloud
        self.visKm = visKm
        self.gustKph = gustKph
    }
}
