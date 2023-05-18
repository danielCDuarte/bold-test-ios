//
//  Module+Injection.swift
//  bold-test
//
//  Created by Daniel Crespo Duarte on 16/05/23.
//

import Foundation
import Resolver

extension Resolver {
    static func RegisterModuleDependencies (with baseUrl: String){
        registerData(with: baseUrl)
        registerDomain()
        registerPresentation()
    }
    
}

extension Resolver {
    static func registerData(with baseUrl: String) {
        register {
            URLSession(configuration: URLSession.configuration())
        }
        register {
            NetworkService(url: baseUrl, urlSession: resolve(URLSession.self))
        }.implements(NetworkServiceType.self)
        
        register {
            WeatherRepositories(networkService: resolve(NetworkServiceType.self))
        }.implements(WeatherRepositoriesType.self)
        
    }
    
    static func registerDomain(){
        register {
            GetCitiesByQueryUseCase(repository: resolve(WeatherRepositoriesType.self))
        }.implements( AnyUseCase<String, [CityObject]>.self)
        
        register {
            GetForecastUseCase(repository: resolve(WeatherRepositoriesType.self))
        }.implements( AnyUseCase<String, ForecastObject>.self)
    }
    
    static func registerPresentation() {
        register(SearchCitiesViewModel.self){ _ in
            return SearchCitiesViewModel(getCitiesByQueryUseCase: resolve(AnyUseCase<String, [CityObject]>.self))
        }
        
        register(DetailCityForecastViewModel.self){ _ in
            return DetailCityForecastViewModel(getForecastUseCase: resolve(AnyUseCase<String, ForecastObject>.self))
        }
    }
    
}
