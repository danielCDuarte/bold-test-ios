//
//  APICityResponse.swift
//  bold-test
//
//  Created by Daniel Crespo Duarte on 15/05/23.
//

import Foundation

struct APICityResponse: Codable {
    var id: Int
    var name: String
    var region: String
    var country: String
    var lat: Float
    var lon: Float
    var url: String
    
    init(id: Int,
         name: String,
         region: String,
         country: String,
         lat: Float,
         lon: Float,
         url: String) {
        self.id = id
        self.name = name
        self.region = region
        self.country = country
        self.lat = lat
        self.lon = lon
        self.url = url
    }
}
