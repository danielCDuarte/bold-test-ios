//
//  DataConstants.swift
//  bold-test
//
//  Created by Daniel Crespo Duarte on 15/05/23.
//

struct DataConstants {
    enum APIClient {
        static let contentType: String = "Content-Type"
    }
    
    enum InnerConstants {
        static let applicationJson: String = "application/json"
    }
    struct WS {
        static let search: String = "/search.json"
        static let forecast: String = "/forecast.json"
    }
    
    static let baseUrl: String = "https://api.weatherapi.com/v1"
    static let apikey: String = "de5553176da64306b86153651221606"
    static let days: String = "4"
}
