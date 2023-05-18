//
//  DetailCityForecastView.swift
//  bold-test
//
//  Created by Daniel Crespo Duarte on 16/05/23.
//

import Resolver
import SwiftUI
import SkeletonUI

struct DetailCityForecastView<ViewModelType>: View where ViewModelType: DetailCityForecastViewModelType {
    var city: CityObject?
    
    @ObservedObject var viewModel: ViewModelType = Resolver.resolve()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                LocationContentView(
                    location: viewModel.state.forecast?.location,
                    loading: viewModel.state.isLoading
                )
                CurrentContentView(
                    current: viewModel.state.forecast?.current,
                    loading: viewModel.state.isLoading
                )
                ForecastDaysContentView(
                    forecastDays: viewModel.state.forecast?.forecast,
                    loading: viewModel.state.isLoading
                )
            }.padding()
                .onAppear {
                    viewModel.onAppear(city: city)
                }
                .onDisappear {
                    viewModel.onDisAppear()
                }
            Spacer()
        }
        .navigationBarTitle(DetailCityForecastState.Constants.title, displayMode: .inline)
        .alert(isPresented: $viewModel.state.alert) {
            Alert(
                title: Text(DetailCityForecastState.Constants.error),
                message: Text(DetailCityForecastState.Constants.error),
                dismissButton: .cancel(Text(DetailCityForecastState.Constants.ok)))
        }
    }
}
