//
//  NetworkServiceMock.swift
//  bold-testTests
//
//  Created by Daniel Crespo Duarte on 17/05/23.
//

import Foundation
import Combine

@testable import bold_test

final class NetworkServiceMock {
    static var error: Error?
    static var response: AnyObject!
}

extension NetworkServiceMock: NetworkServiceType {
    func setBaseUrl(_ baseUrl: String) {
        debugPrint(baseUrl)
    }
    
    func request<Response>(_ endpoint: NetworkRequest<Response>, queue: DispatchQueue) -> AnyPublisher<Response, Error> where Response : Decodable {
        var respObject: Response! = nil
        if NetworkServiceMock.response != nil {
            respObject = NetworkServiceMock.response as? Response
        }
        let publisher = CurrentValueSubject<Response, Error>(respObject)
        if let error = NetworkServiceMock.error {
            publisher.send(completion: .failure(error))
        }
        return publisher.eraseToAnyPublisher()
    }
    
}
