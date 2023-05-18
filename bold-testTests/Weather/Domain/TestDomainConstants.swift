//
//  TestDomainConstants.swift
//  bold-testTests
//
//  Created by Daniel Crespo Duarte on 17/05/23.
//

import Foundation
@testable import bold_test

struct TestDomainConstants {
    static let emptyCity: CityObject = {
        CityObject(
            id: 0,
            name: "",
            region: "",
            country: "",
            lat: 0.0,
            lon: 0.0,
            url: ""
        )
    }()
    
    static let city: CityObject = {
        CityObject(
            id: 2801268,
            name: "London",
            region: "City of London, Greater London",
            country: "United Kingdom",
            lat: 51.52,
            lon: -0.11,
            url: "london-city-of-london-greater-london-united-kingdom"
        )
    }()
    
    static let cities: [CityObject] = {
        [
            CityObject(
                id: 2801268,
                name: "London",
                region: "City of London, Greater London",
                country: "United Kingdom",
                lat: 51.52,
                lon: -0.11,
                url: "london-city-of-london-greater-london-united-kingdom"
            ),
            CityObject(
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
    
    static let emptyforecast: ForecastObject = {
        ForecastObject(
            location: LocationObject(
                name: "",
                region: "",
                country: "",
                lat: 0.0,
                lon: 0.0,
                localtime: ""
            ),
            current: CurrentObject(
                tempC: "0.0 °C",
                condition: ConditionObject(
                    text: "",
                    icon: "",
                    code: 0
                ), windKph: "0.0 km/hr",
                humidity: "0",
                cloud: "0",
                visKm: "0.0 Km",
                gustKph: "0.0 km/hr"
            ),
            forecast: ForecastDaysObject(forecastday: [
                ForecastDayObject(
                    date: "",
                    day: DayObject(
                        maxtempC: "0.0 °C",
                        mintempC: "0.0 °C",
                        maxwindKph: "0.0 km/hr",
                        condition: ConditionObject(
                            text: "",
                            icon: "", code: 0)
                    ), hour: [
                        HourObject(
                            time: "",
                            tempC: "0.0 °C",
                            condition: ConditionObject(
                                text: "",
                                icon: "",
                                code: 0),
                            windKph: "0.0 km/hr",
                            humidity: "0"
                        )
                    ])
            ])
        )
    }()
    
    static let forecast: ForecastObject = {
        ForecastObject(
            location: LocationObject(
                name: "London",
                region: "City of London, Greater London",
                country: "United Kingdom",
                lat: 51.52,
                lon: -0.11,
                localtime: "2023-05-17 17:49"
            ),
            current: CurrentObject(
                tempC: "17.0 °C",
                condition: ConditionObject(
                    text: "Partly cloudy",
                    icon: "https://cdn.weatherapi.com/weather/64x64/day/116.png",
                    code: 1003
                ),
                windKph: "11.2 km/hr",
                humidity: "52",
                cloud: "50",
                visKm: "10.0 Km",
                gustKph: "11.2 km/hr"
            ),
            forecast: ForecastDaysObject(
                forecastday: [
                    ForecastDayObject(
                        date: "2023-05-17",
                        day: DayObject(
                            maxtempC: "16.9 °C",
                            mintempC: "7.9 °C",
                            maxwindKph: "13.0 km/hr",
                            condition: ConditionObject(
                                text: "Patchy rain possible",
                                icon: "https://cdn.weatherapi.com/weather/64x64/day/176.png",
                                code: 1063
                            )
                        ),
                        hour: [HourObject(
                            time: "2023-05-17 00:00",
                            tempC: "9.2 °C",
                            condition: ConditionObject(
                                text: "Patchy rain possible",
                                icon: "https://cdn.weatherapi.com/weather/64x64/night/176.png",
                                code: 1063
                            ),
                            windKph: "3.1 km/hr",
                            humidity: "91"
                        )
                        ]
                    )
                ]
            )
        )
    }()
}
