//
//  HourCellView.swift
//  bold-test
//
//  Created by Daniel Crespo Duarte on 17/05/23.
//

import SkeletonUI
import SwiftUI

struct HourCellView: View {
    private struct Constants {
        static let hour = "Hour:"
        static let windSpeed = "Wind speed:"
        static let humidity = "Humidity:"
    }
    
    var hour: HourObject?
    var loading: Bool
    
    
    init(hour: HourObject?,
         loading: Bool) {
        self.hour = hour
        self.loading = loading
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            HStack(spacing: 10) {
                Text(Constants.hour)
                    .font(.headline)
                    .foregroundColor(.black)
                    .skeleton(with: loading)
                    .shape(type: .rectangle)
                    .appearance(type: .gradient())
                    .animation(type: .pulse())
                Text(hour?.time)
                    .font(.subheadline)
                    .foregroundColor(.black)
                    .skeleton(with: loading)
                    .shape(type: .rectangle)
                    .appearance(type: .gradient())
                    .animation(type: .pulse())
            }
            HStack(spacing: 10) {
                Text(hour?.condition.text)
                    .font(.subheadline)
                    .foregroundColor(.black)
                    .skeleton(with: loading)
                    .shape(type: .rectangle)
                    .appearance(type: .gradient())
                    .animation(type: .pulse())
                ZStack {
                    AsyncImage(url: URL.getUrl(from: hour?.condition.icon)) { image in
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
                Text(Constants.windSpeed)
                    .font(.subheadline)
                    .foregroundColor(.black)
                    .skeleton(with: loading)
                    .shape(type: .rectangle)
                    .appearance(type: .gradient())
                    .animation(type: .pulse())
                Text(hour?.windKph)
                    .font(.subheadline)
                    .foregroundColor(.black)
                    .skeleton(with: loading)
                    .shape(type: .rectangle)
                    .appearance(type: .gradient())
                    .animation(type: .pulse())
            }
        }
    }
    
}

struct HourCellView_Previews: PreviewProvider {
    static var previews: some View {
        HourCellView(
            hour: HourObject(
                time: "2023-05-17 00:00",
                tempC: "9.2",
                condition: ConditionObject(
                    text: "Patchy rain possible",
                    icon: "//cdn.weatherapi.com/weather/64x64/night/176.png",
                    code: 1063
                ),
                windKph: "3.1",
                humidity: "91"
            ),
            loading: false
        )
    }
}
