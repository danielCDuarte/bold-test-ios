//
//  LocationObject.swift
//  bold-test
//
//  Created by Daniel Crespo Duarte on 16/05/23.
//

import Foundation

struct LocationObject: Identifiable {
    let id = UUID()
    var name: String
    var region: String
    var country: String
    var lat: Float
    var lon: Float
    var localtime: String
    
    init(name: String,
         region: String,
         country: String,
         lat: Float,
         lon: Float,
         localtime: String) {
        self.name = name
        self.region = region
        self.country = country
        self.lat = lat
        self.lon = lon
        self.localtime = localtime
    }
}
