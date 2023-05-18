//
//  CurrentContentView.swift
//  bold-test
//
//  Created by Daniel Crespo Duarte on 17/05/23.
//

import SkeletonUI
import SwiftUI

struct CurrentContentView: View {
    private struct Constants {
        static let current = "Current"
        static let temperature = "Temperature:"
        static let windSpeed = "Wind speed:"
        static let humidity = "Humidity:"
    }
    
    var current: CurrentObject?
    var loading: Bool

    init(current: CurrentObject?,
         loading: Bool) {
        self.current = current
        self.loading = loading
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Text(Constants.current)
                .font(.title3)
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
                .skeleton(with: loading)
                .shape(type: .rectangle)
                .appearance(type: .gradient())
                .animation(type: .pulse())
            HStack(alignment: .center, spacing: 20) {
                Text(Constants.temperature)
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                    .skeleton(with: loading)
                    .shape(type: .rectangle)
                    .appearance(type: .gradient())
                    .animation(type: .pulse())
                Text(current?.tempC)
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                    .skeleton(with: loading)
                    .shape(type: .rectangle)
                    .appearance(type: .gradient())
                    .animation(type: .pulse())
            }
            HStack(spacing: 10) {
                Text(current?.condition.text)
                    .font(.subheadline)
                    .foregroundColor(.black)
                    .skeleton(with: loading)
                    .shape(type: .rectangle)
                    .appearance(type: .gradient())
                    .animation(type: .pulse())
                ZStack {
                    AsyncImage(url: URL.getUrl(from: current?.condition.icon)) { image in
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
            HStack(alignment: .center, spacing: 20) {
                Text(Constants.windSpeed)
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                    .skeleton(with: loading)
                    .shape(type: .rectangle)
                    .appearance(type: .gradient())
                    .animation(type: .pulse())
                Text(current?.windKph)
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                    .skeleton(with: loading)
                    .shape(type: .rectangle)
                    .appearance(type: .gradient())
                    .animation(type: .pulse())
                Text(Constants.humidity)
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                    .skeleton(with: loading)
                    .shape(type: .rectangle)
                    .appearance(type: .gradient())
                    .animation(type: .pulse())
                Text(current?.humidity)
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                    .skeleton(with: loading)
                    .shape(type: .rectangle)
                    .appearance(type: .gradient())
                    .animation(type: .pulse())
            }
            Divider()
        }
    }
}

struct CurrentContentView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentContentView(current: CurrentObject(
            tempC: "17.0 °C",
            condition: ConditionObject(
                text: "Partly cloudy",
                icon: "//cdn.weatherapi.com/weather/64x64/day/116.png",
                code: 1003
            ),
            windKph: "11.2 km/hr",
            humidity: "52",
            cloud: "50",
            visKm: "10.0 Km",
            gustKph: "11.2 km/hr"
        ),
        loading: false
        )
    }
}
