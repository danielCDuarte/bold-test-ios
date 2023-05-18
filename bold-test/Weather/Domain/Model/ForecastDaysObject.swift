//
//  ForecastDaysObject.swift
//  bold-test
//
//  Created by Daniel Crespo Duarte on 16/05/23.
//

import Foundation

struct ForecastDaysObject: Identifiable {
    let id = UUID()
    var forecastday: [ForecastDayObject]
    
    init(forecastday: [ForecastDayObject]) {
        self.forecastday = forecastday
    }
}
