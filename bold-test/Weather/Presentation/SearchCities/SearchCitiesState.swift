//
//  SearchCitiesState.swift
//  bold-test
//
//  Created by Daniel Crespo Duarte on 16/05/23.
//

import Foundation
import SwiftUI

final class SearchCitiesState: ObservableObject {
    @Published var cities: [CityObject] = []
    @Published var isLoading: Bool = true
    @Published var numberSkeletonCell: Int = 8
    @Published var alert: Bool = false
    
    enum Constants {
        static let title = "Search cities"
        static let error = "Error"
        static let errorMessage = "An error has occurred"
        static let ok = "Ok"
    }
}
