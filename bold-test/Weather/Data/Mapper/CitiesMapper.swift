//
//  CitiesMapper.swift
//  bold-test
//
//  Created by Daniel Crespo Duarte on 15/05/23.
//

import Foundation

struct CitiesMapper: MapperType {
    typealias Input = [APICityResponse]
    typealias Output = [CityObject]
    
    static func map(input: [APICityResponse]) -> [CityObject] {
        let cities = input.map {
            getCity(input: $0)
        }
        return cities
    }
    
    private static func getCity(input: APICityResponse) -> CityObject {
        return CityObject(
            id: input.id,
            name: input.name,
            region: input.region,
            country: input.country,
            lat: input.lat,
            lon: input.lon,
            url: input.url
        )
    }
    
}
