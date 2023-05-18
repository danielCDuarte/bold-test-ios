//
//  DetailCityForecastContract.swift
//  bold-test
//
//  Created by Daniel Crespo Duarte on 16/05/23.
//

import Foundation
import SwiftUI

protocol DetailCityForecastViewModelType: ObservableObject {
    var state: DetailCityForecastState { get set }
    func onAppear(city: CityObject?)
    func onDisAppear()
}
