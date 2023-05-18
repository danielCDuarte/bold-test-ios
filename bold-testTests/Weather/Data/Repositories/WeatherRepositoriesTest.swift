//
//  WeatherRepositoriesTest.swift
//  bold-testTests
//
//  Created by Daniel Crespo Duarte on 17/05/23.
//

import Foundation
import XCTest
import Combine

@testable import bold_test

final class WeatherRepositoriesTest: XCTestCase {
    private var cancellable: AnyCancellable?
    private var networkService: NetworkServiceType!
    private var sut: WeatherRepositoriesType!
    
    override func setUp() {
        super.setUp()
        networkService = NetworkServiceMock()
        sut = WeatherRepositories(networkService: networkService)
    }
    
    override func tearDown() {
        NetworkServiceMock.response = nil
        NetworkServiceMock.error = nil
        sut = nil
        cancellable = nil
        super.tearDown()
    }
    
    func testGetCitiesByQueryRepository_ResponseSuccess() {
        //Given
        let expectationFailure = expectation(description: "failure")
        let successExpectation = expectation(description: "Consume Web Service Response Expectation")
        expectationFailure.isInverted = true
        
        NetworkServiceMock.response = TestDataConstants.citiesResponse as AnyObject
        
        //When
        self.cancellable = sut.getCities(by: "London")
            .sink { completion in
                guard case .failure(let error) = completion else {
                    return
                }
                XCTFail(error.localizedDescription)
                expectationFailure.fulfill()
            } receiveValue: { response in
                // then
                XCTAssertNotNil(response)
                successExpectation.fulfill()
            }
        
        //Then
        self.wait(for: [expectationFailure, successExpectation], timeout: 1)
        self.cancellable?.cancel()
    }
    
    func testGetCitiesByQueryRepository_ResponseFailure() {
        //Given
        let expectationFailure = expectation(description: "failure")
        let expectation = expectation(description: "Consume Web Service Response Expectation")
        expectation.isInverted = true
        NetworkServiceMock.response = TestDataConstants.citiesResponse as AnyObject
        NetworkServiceMock.error = NetworkError.emptyJson
        
        //When
        self.cancellable = sut.getCities(by: "London")
            .sink(receiveCompletion: { completion in
                guard case .failure(let error) = completion else { return
                    XCTFail("completion is not a failure")
                }
                XCTAssertEqual(error.localizedDescription, NetworkError.emptyJson.localizedDescription)
                expectationFailure.fulfill()
            },
                  receiveValue: { _ in
                // Then
                expectation.fulfill()
            })
        
        //Then
        self.wait(for: [expectationFailure, expectation], timeout: 1)
        self.cancellable?.cancel()
    }
    
    func testGetForecastRepository_ResponseSuccess() {
        //Given
        let expectationFailure = expectation(description: "failure")
        let successExpectation = expectation(description: "Consume Web Service Response Expectation")
        expectationFailure.isInverted = true
        
        NetworkServiceMock.response = TestDataConstants.forecastResponse as AnyObject
        
        //When
        self.cancellable = sut.getForecast(by: "London")
            .sink { completion in
                guard case .failure(let error) = completion else {
                    return
                }
                XCTFail(error.localizedDescription)
                expectationFailure.fulfill()
            } receiveValue: { response in
                // then
                XCTAssertNotNil(response)
                successExpectation.fulfill()
            }
        
        //Then
        self.wait(for: [expectationFailure, successExpectation], timeout: 1)
        self.cancellable?.cancel()
    }
    
    func testGetForecastRepository_ResponseFailure() {
        //Given
        let expectationFailure = expectation(description: "failure")
        let expectation = self.expectation(description: "Consume Web Service Response Expectation")
        expectation.isInverted = true
        
        NetworkServiceMock.response = TestDataConstants.forecastResponse as AnyObject
        NetworkServiceMock.error = NetworkError.emptyJson
        
        //When
        self.cancellable = sut.getForecast(by: "London")
            .sink(receiveCompletion: { completion in
                guard case .failure(let error) = completion else { return
                    XCTFail("completion is not a failure")
                }
                XCTAssertEqual(error.localizedDescription, NetworkError.emptyJson.localizedDescription)
                expectationFailure.fulfill()
            },
                  receiveValue: { _ in
                // Then
                expectation.fulfill()
            })
        
        //Then
        self.wait(for: [expectationFailure, expectation], timeout: 1)
        self.cancellable?.cancel()
    }
}
