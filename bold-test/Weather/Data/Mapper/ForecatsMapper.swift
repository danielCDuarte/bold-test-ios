//
//  ForecatsMapper.swift
//  bold-test
//
//  Created by Daniel Crespo Duarte on 15/05/23.
//

import Foundation

struct ForecatsMapper: MapperType {
    private struct Constants {
        static let Kph = "km/hr"
        static let c = "°C"
        static let Km = "Km"
        static let https = "https:"
    }
    
    typealias Input = APIForecastResponse
    typealias Output = ForecastObject
    
    static func map(input: APIForecastResponse) -> ForecastObject {
        return ForecastObject(
            location: getLocation(input: input.location),
            current: getCurrent(input: input.current),
            forecast: getForecast(input: input.forecast)
        )
    }
    
    private static func getLocation(input: APILocationResponse) -> LocationObject {
        return LocationObject(
            name: input.name,
            region: input.region,
            country: input.country,
            lat: input.lat,
            lon: input.lon,
            localtime: input.localtime
        )
    }
    
    private static func getCurrent(input: APICurrentResponse) -> CurrentObject {
        return CurrentObject(
            tempC: "\(input.tempC) \(Constants.c)",
            condition: getCondition(input: input.condition),
            windKph: "\(input.windKph) \(Constants.Kph)",
            humidity: "\(input.humidity)",
            cloud: "\(input.cloud)",
            visKm: "\(input.visKm) \(Constants.Km)",
            gustKph: "\(input.gustKph) \(Constants.Kph)"
        )
    }
    
    private static func getCondition(input: APIConditionResponse) -> ConditionObject {
        return ConditionObject(
            text: input.text,
            icon: "\(Constants.https)\(input.icon)",
            code: input.code
        )
    }
    
    private static func getForecast(input: APIForecastDaysResponse) -> ForecastDaysObject {
        return ForecastDaysObject(forecastday: getForecastday(input: input.forecastday))
    }
    
    private static func getForecastday(input: [APIForecastDayResponse]) -> [ForecastDayObject] {
        return input.map {
            getForecastDay(input: $0)
        }
    }
    
    private static func getForecastDay(input: APIForecastDayResponse) -> ForecastDayObject {
        return ForecastDayObject(
            date: input.date,
            day: getDay(input: input.day),
            hour: input.hour.map {
                getHour(input: $0)
            }
        )
    }
    
    private static func getDay(input: APIDayResponse) -> DayObject  {
        return DayObject(
            maxtempC: "\(input.maxtempC) \(Constants.c)",
            mintempC: "\(input.mintempC) \(Constants.c)",
            maxwindKph: "\(input.maxwindKph) \(Constants.Kph)",
            condition: getCondition(input: input.condition)
        )
    }
    
    private static func getHour(input: APIHourResponse) -> HourObject {
        return HourObject(
            time: input.time,
            tempC: "\(input.tempC) \(Constants.c)",
            condition: getCondition(input: input.condition),
            windKph: "\(input.windKph) \(Constants.Kph)",
            humidity: "\(input.humidity)"
        )
    }
}
