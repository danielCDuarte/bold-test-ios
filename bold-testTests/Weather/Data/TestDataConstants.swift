//
//  TestDataConstants.swift
//  bold-testTests
//
//  Created by Daniel Crespo Duarte on 17/05/23.
//

import Foundation
@testable import bold_test

struct TestDataConstants {
    static let citiesResponse: [APICityResponse] = {
        [
            APICityResponse(
                id: 2801268,
                name: "London",
                region: "City of London, Greater London",
                country: "United Kingdom",
                lat: 51.52,
                lon: -0.11,
                url: "london-city-of-london-greater-london-united-kingdom"
            ),
            APICityResponse(
                id: 2801275,
                name: "Londonderry",
                region: "North Yorkshire",
                country: "United Kingdom",
                lat: 54.28,
                lon: -1.53,
                url: "londonderry-north-yorkshire-united-kingdom"
            )
        ]
    }()
    
    static let forecastResponse: APIForecastResponse = {
        APIForecastResponse(
            location: APILocationResponse(
                name: "London",
                region: "City of London, Greater London",
                country: "United Kingdom",
                lat: 51.52,
                lon: -0.11,
                localtime: "2023-05-17 17:49"
            ),
            current: APICurrentResponse(
                tempC: 17.0,
                condition: APIConditionResponse(
                    text: "Partly cloudy",
                    icon: "//cdn.weatherapi.com/weather/64x64/day/116.png",
                    code: 1003
                ),
                windKph: 11.2,
                humidity: 52,
                cloud: 50,
                visKm: 10.0,
                gustKph: 11.2
            ),
            forecast: APIForecastDaysResponse(
                forecastday: [
                    APIForecastDayResponse(
                        date: "2023-05-17",
                        day: APIDayResponse(
                            maxtempC: 16.9,
                            mintempC: 7.9,
                            maxwindKph: 13.0,
                            condition: APIConditionResponse(
                                text: "Patchy rain possible",
                                icon: "//cdn.weatherapi.com/weather/64x64/day/176.png",
                                code: 1063
                            )
                        ),
                        hour: [
                            APIHourResponse(
                                time: "2023-05-17 00:00",
                                tempC: 9.2,
                                condition: APIConditionResponse(
                                    text: "Patchy rain possible",
                                    icon: "//cdn.weatherapi.com/weather/64x64/night/176.png",
                                    code: 1063
                                ),
                                windKph: 3.1,
                                humidity: 91
                            )
                        ]
                    )
                ])
        )
    }()
    
}
