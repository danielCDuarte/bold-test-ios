//
//  ForecastObject.swift
//  bold-test
//
//  Created by Daniel Crespo Duarte on 16/05/23.
//

import Foundation

struct ForecastObject: Identifiable {
    let id = UUID()
    var location: LocationObject
    var current: CurrentObject
    var forecast: ForecastDaysObject
    
    init(location: LocationObject,
         current: CurrentObject,
         forecast: ForecastDaysObject) {
        self.location = location
        self.current = current
        self.forecast = forecast
    }
    
}
