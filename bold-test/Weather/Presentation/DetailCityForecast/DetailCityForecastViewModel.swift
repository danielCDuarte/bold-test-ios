//
//  DetailCityForecastViewModel.swift
//  bold-test
//
//  Created by Daniel Crespo Duarte on 16/05/23.
//

import Combine
import Resolver
import Foundation

final class DetailCityForecastViewModel: BaseViewModel {
    private var forecast: ForecastObject?
    private var subscribers: Set<AnyCancellable> = []
    @Published var state = DetailCityForecastState()
    
    private let getForecastUseCase: AnyUseCase<String, ForecastObject>
    
    init(getForecastUseCase: AnyUseCase<String, ForecastObject>) {
        self.getForecastUseCase = getForecastUseCase
        super.init()
        errorHandler = self
    }
    
    private func getForecast(_ city: CityObject) {
        getForecastUseCase.execute(params: city.name)
            .sink { [weak self] completion in
                guard case .failure(let error) = completion else { return }
                self?.showError(error: error)
            } receiveValue: { [weak self] forecast in
                self?.bindForecast(with: forecast)
            }
            .store(in: &subscribers)
    }
    
    private func bindForecast(with forecastObject: ForecastObject) {
        forecast = forecastObject
        state.forecast = forecastObject
        state.isLoading = false
        objectWillChange.send()
    }
}

extension DetailCityForecastViewModel: DetailCityForecastViewModelType {
    
    func onAppear(city: CityObject?) {
        state.isLoading = true
        objectWillChange.send()
        if let city = city {
            getForecast(city)
        }
    }
    
    func onDisAppear() {
        loading = false
    }
}

extension DetailCityForecastViewModel: BaseView {
    func showError(error: Error) {
        state.alert = true
        objectWillChange.send()
    }
}
