//
//  ForecastDaysContentView.swift
//  bold-test
//
//  Created by Daniel Crespo Duarte on 17/05/23.
//

import SkeletonUI
import SwiftUI

struct ForecastDaysContentView: View {
    private struct Constants {
        static let forecast = "Forecast"
        static let numberSkeletonCell = 2
    }
    var forecastDays: ForecastDaysObject?
    var loading: Bool
    
    init(forecastDays: ForecastDaysObject?,
         loading: Bool) {
        self.forecastDays = forecastDays
        self.loading = loading
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Text(Constants.forecast)
                .font(.title3)
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
                .skeleton(with: loading)
                .shape(type: .rectangle)
                .appearance(type: .gradient())
                .animation(type: .pulse())
            SkeletonForEachWithIndex(with: forecastDays?.forecastday ?? [], quantity: Constants.numberSkeletonCell) { _, loading, forecastday in
                ForecastDayCellView(forecastDay: forecastday, loading: loading)
                Divider()
            }
        }
    }
}

struct ForecastDaysContentView_Previews: PreviewProvider {
    static var previews: some View {
        ForecastDaysContentView(
            forecastDays: ForecastDaysObject(
                forecastday: [
                    ForecastDayObject(
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
                    )
                ]
            ),
            loading: false
        )
    }
}
