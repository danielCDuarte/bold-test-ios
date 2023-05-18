//
//  LocationContentView.swift
//  bold-test
//
//  Created by Daniel Crespo Duarte on 17/05/23.
//

import SkeletonUI
import SwiftUI
import MapKit

struct LocationContentView: View {
    private struct Constants {
        static let country = "Country:"
        static let time = "Time:"
    }
    
    var location: LocationObject?
    var loading: Bool
    
    init(location: LocationObject?,
         loading: Bool) {
        self.location = location
        self.loading = loading
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Text(location?.name)
                .font(.title)
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
                .skeleton(with: loading)
                .shape(type: .rectangle)
                .appearance(type: .gradient())
                .animation(type: .pulse())
            HStack(alignment: .center, spacing: 20) {
                Text(Constants.country)
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                    .skeleton(with: loading)
                    .shape(type: .rectangle)
                    .appearance(type: .gradient())
                    .animation(type: .pulse())
                Text(location?.country)
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                    .skeleton(with: loading)
                    .shape(type: .rectangle)
                    .appearance(type: .gradient())
                    .animation(type: .pulse())
            }
            HStack(alignment: .center, spacing: 20) {
                Text(Constants.time)
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                    .skeleton(with: loading)
                    .shape(type: .rectangle)
                    .appearance(type: .gradient())
                    .animation(type: .pulse())
                Text(location?.localtime)
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                    .skeleton(with: loading)
                    .shape(type: .rectangle)
                    .appearance(type: .gradient())
                    .animation(type: .pulse())
            }
            Map(coordinateRegion: .constant(
                MKCoordinateRegion(
                    center: CLLocationCoordinate2D(
                        latitude: CLLocationDegrees(location?.lat ?? 0.0),
                        longitude: CLLocationDegrees(location?.lon ?? 0.0)),
                    span: MKCoordinateSpan(
                        latitudeDelta: 0.5,
                        longitudeDelta: 0.5)
                )
            ), interactionModes: [])
            .frame(height: 200)
        }
    }
}

struct LocationContentView_Previews: PreviewProvider {
    static var previews: some View {
        LocationContentView(
            location: LocationObject(
                name: "London",
                region: "City of London, Greater London",
                country: "United Kingdom",
                lat: 51.52,
                lon: -0.11,
                localtime: "2023-05-17 17:49"
            ),
            loading: false
        )
    }
}
