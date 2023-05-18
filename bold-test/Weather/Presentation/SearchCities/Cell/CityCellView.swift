//
//  CityCellView.swift
//  bold-test
//
//  Created by Daniel Crespo Duarte on 16/05/23.
//

import SkeletonUI
import SwiftUI

struct CityCellView: View {
    
    var city: CityObject?
    var loading: Bool
    
    
    init(city: CityObject?,
         loading: Bool) {
        self.city = city
        self.loading = loading
    }
    
    var body: some View {
        HStack(spacing: 10) {
            ZStack {
                Image(PresentationConstants.images.weather)
                    .resizable()
                    .scaledToFit()
                    .skeleton(with: loading)
                    .shape(type: .rectangle)
                    .appearance(type: .gradient())
                    .animation(type: .pulse())
                    .foregroundColor(Color.gray)
                    .cornerRadius(4)
                    .frame(width: 50, height: 50)
            }
            .foregroundColor(.gray)
            Text(city?.description)
                .font(.subheadline)
                .foregroundColor(.black)
                .skeleton(with: loading)
                .shape(type: .rectangle)
                .appearance(type: .gradient())
                .animation(type: .pulse())
            Spacer()
        }
    }
}

struct CityCellView_Previews: PreviewProvider {
    static var previews: some View {
        CityCellView(
            city: CityObject(
                id: 2801268,
                name: "London",
                region: "City of London, Greater London",
                country: "United Kingdom",
                lat: 51.52,
                lon: -0.11,
                url: "london-city-of-london-greater-london-united-kingdom"
            ),
            loading: false
        )
    }
}
