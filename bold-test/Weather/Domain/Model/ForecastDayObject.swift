//
//  ForecastDayObject.swift
//  bold-test
//
//  Created by Daniel Crespo Duarte on 16/05/23.
//

import Foundation

struct ForecastDayObject: Identifiable {
    let id = UUID()
    var date: String
    var day: DayObject
    var hour: [HourObject]
    
    init(date: String,
         day: DayObject,
         hour: [HourObject]) {
        self.date = date
        self.day = day
        self.hour = hour
    }
}
