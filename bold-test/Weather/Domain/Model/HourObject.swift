//
//  HourObject.swift
//  bold-test
//
//  Created by Daniel Crespo Duarte on 16/05/23.
//

import Foundation

struct HourObject: Identifiable {
    let id = UUID()
    var time: String
    var tempC: String
    var condition: ConditionObject
    var windKph: String
    var humidity: String
    
    init(time: String,
         tempC: String,
         condition: ConditionObject,
         windKph: String,
         humidity: String) {
        self.time = time
        self.tempC = tempC
        self.condition = condition
        self.windKph = windKph
        self.humidity = humidity
    }
}
