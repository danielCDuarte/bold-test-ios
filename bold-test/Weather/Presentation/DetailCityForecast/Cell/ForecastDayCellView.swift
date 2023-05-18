//
//  ForecastDayCellView.swift
//  bold-test
//
//  Created by Daniel Crespo Duarte on 17/05/23.
//

import SkeletonUI
import SwiftUI

struct ForecastDayCellView: View {
    private struct Constants {
        static let date = "Day date:"
        static let maxTemp = "Max temperature:"
        static let minTemp = "Min temperature:"
        static let windSpeed = "Max wind speed:"
        static let humidity = "Humidity:"
        static let numberSkeletonCell = 2
    }
    
    var forecastDay: ForecastDayObject?
    var loading: Bool
    
    init(forecastDay: ForecastDayObject?,
         loading: Bool) {
        self.forecastDay = forecastDay
        self.loading = loading
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            HStack(spacing: 10) {
                Text(Constants.date)
                    .font(.headline)
                    .foregroundColor(.black)
                    .skeleton(with: loading)
                    .shape(type: .rectangle)
                    .appearance(type: .gradient())
                    .animation(type: .pulse())
                Text(forecastDay?.date)
                    .font(.subheadline)
                    .foregroundColor(.black)
                    .skeleton(with: loading)
                    .shape(type: .rectangle)
                    .appearance(type: .gradient())
                    .animation(type: .pulse())
            }
            HStack(spacing: 10) {
                Text(forecastDay?.day.condition.text)
                    .font(.subheadline)
                    .foregroundColor(.black)
                    .skeleton(with: loading)
                    .shape(type: .rectangle)
                    .appearance(type: .gradient())
                    .animation(type: .pulse())
                ZStack {
                    AsyncImage(url: URL.getUrl(from: forecastDay?.day.condition.icon)) { image in
                        image
                            .resizable()
                            .scaledToFit()
                    } placeholder: {
                        AnyView(ActivityIndicator())
                    }
                    .skeleton(with: loading)
                    .shape(type: .rectangle)
                    .appearance(type: .gradient())
                    .animation(type: .pulse())
                    .foregroundColor(Color.gray)
                    .cornerRadius(4)
                    .frame(width: 40, height: 40)
                }
                .foregroundColor(.gray)
            }
            HStack(spacing: 10) {
                Text(Constants.minTemp)
                    .font(.subheadline)
                    .foregroundColor(.black)
                    .skeleton(with: loading)
                    .shape(type: .rectangle)
                    .appearance(type: .gradient())
                    .animation(type: .pulse())
                Text(forecastDay?.day.mintempC)
                    .font(.subheadline)
                    .foregroundColor(.black)
                    .skeleton(with: loading)
                    .shape(type: .rectangle)
                    .appearance(type: .gradient())
                    .animation(type: .pulse())
            }
            HStack(spacing: 10) {
                Text(Constants.maxTemp)
                    .font(.subheadline)
                    .foregroundColor(.black)
                    .skeleton(with: loading)
                    .shape(type: .rectangle)
                    .appearance(type: .gradient())
                    .animation(type: .pulse())
                Text(forecastDay?.day.maxtempC)
                    .font(.subheadline)
                    .foregroundColor(.black)
                    .skeleton(with: loading)
                    .shape(type: .rectangle)
                    .appearance(type: .gradient())
                    .animation(type: .pulse())
            }
            HStack(spacing: 10) {
                Text(Constants.windSpeed)
                    .font(.subheadline)
                    .foregroundColor(.black)
                    .skeleton(with: loading)
                    .shape(type: .rectangle)
                    .appearance(type: .gradient())
                    .animation(type: .pulse())
                Text(forecastDay?.day.maxwindKph)
                    .font(.subheadline)
                    .foregroundColor(.black)
                    .skeleton(with: loading)
                    .shape(type: .rectangle)
                    .appearance(type: .gradient())
                    .animation(type: .pulse())
            }
            Divider()
            SkeletonForEachWithIndex(with: forecastDay?.hour ?? [], quantity: Constants.numberSkeletonCell) { _, loading, hour in
                HourCellView(hour: hour, loading: loading)
                Divider()
            }
        }
        
    }
    
}

struct ForecastDayCellView_Previews: PreviewProvider {
    static var previews: some View {
        ForecastDayCellView(
            forecastDay: ForecastDayObject(
                date: "2023-05-17",
                day: DayObject(
                    maxtempC: "16.9 °C",
                    mintempC: "7.9 °C",
                    maxwindKph: "13.0 km/hr",
                    condition: ConditionObject(
                        text: "Patchy rain possible",
                        icon: "//cdn.weatherapi.com/weather/64x64/day/176.png",
                        code: 1063
                    )
                ),
                hour: [HourObject(
                    time: "2023-05-17 00:00",
                    tempC: "9.2 °C",
                    condition: ConditionObject(
                        text: "Patchy rain possible",
                        icon: "//cdn.weatherapi.com/weather/64x64/night/176.png",
                        code: 1063
                    ),
                    windKph: "3.1 km/hr",
                    humidity: "91"
                )
                ]
            ),
            loading: false
        )
    }
}
