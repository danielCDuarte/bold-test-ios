//
//  DetailCityForecastState.swift
//  bold-test
//
//  Created by Daniel Crespo Duarte on 16/05/23.
//

import Foundation
import SwiftUI

final class DetailCityForecastState: ObservableObject {
    @Published var forecast: ForecastObject?
    @Published var isLoading: Bool = true
    @Published var numberSkeletonCell: Int = 4
    @Published var alert: Bool = false
    
    enum Constants {
        static let title = "City"
        static let location = "Location :"
        static let current = "Current :"
        static let forecast = "Forecast"
        static let error = "Error"
        static let errorMessage = "An error has occurred"
        static let ok = "Ok"
    }
}
