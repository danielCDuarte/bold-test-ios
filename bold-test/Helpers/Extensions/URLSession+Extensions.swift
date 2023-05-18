//
//  URLSession+Extensions.swift
//  bold-test
//
//  Created by Daniel Crespo Duarte on 15/05/23.
//

import Foundation

extension URLSession {
    static func configuration(timeOut: Int = 60,
                              requestCachePolicy: URLRequest.CachePolicy = .reloadRevalidatingCacheData) -> URLSessionConfiguration {
        let configuration = URLSessionConfiguration.default
        configuration.requestCachePolicy = requestCachePolicy
        configuration.timeoutIntervalForRequest = TimeInterval(timeOut)
        return configuration
    }
}
