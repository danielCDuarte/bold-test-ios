//
//  SearchCitiesContract.swift
//  bold-test
//
//  Created by Daniel Crespo Duarte on 16/05/23.
//

import Foundation
import SwiftUI

protocol SearchCitiesViewModelType: ObservableObject {
    var state: SearchCitiesState { get set }
    func searchCity(query: String)
    func onDisAppear()
}
