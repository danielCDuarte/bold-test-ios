//
//  SearchCitiesViewModel.swift
//  bold-test
//
//  Created by Daniel Crespo Duarte on 16/05/23.
//

import Combine
import Resolver
import Foundation

final class SearchCitiesViewModel: BaseViewModel {
    
    private var cities: [CityObject]?
    private var subscribers: Set<AnyCancellable> = []
    @Published var state = SearchCitiesState()
    private let getCitiesByQueryUseCase: AnyUseCase< String, [CityObject]>
    
    init(getCitiesByQueryUseCase: AnyUseCase< String, [CityObject]>) {
        self.getCitiesByQueryUseCase = getCitiesByQueryUseCase
        super.init()
        errorHandler = self
    }
    
    private func getRecipes(query: String) {
        getCitiesByQueryUseCase.execute(params: query)
            .sink { [weak self] completion in
                guard case .failure(let error) = completion else { return }
                self?.showError(error: error)
            } receiveValue: { [weak self] cities in
                self?.bindCities(with: cities)
            }
            .store(in: &subscribers)
        
    }
    
    private func bindCities(with citiesObject: [CityObject]) {
        cities = citiesObject
        state.cities = citiesObject
        state.isLoading = false
        objectWillChange.send()
    }
    
}

extension SearchCitiesViewModel: SearchCitiesViewModelType {
    func searchCity(query: String) {
        state.isLoading = true
        objectWillChange.send()
        if query != "" {
            getRecipes(query: query)
        }
    }
    
    func onDisAppear() {
        loading = false
    }
    
}

extension SearchCitiesViewModel: BaseView {
    func showError(error: Error) {
        state.alert = true
        objectWillChange.send()
    }
}
