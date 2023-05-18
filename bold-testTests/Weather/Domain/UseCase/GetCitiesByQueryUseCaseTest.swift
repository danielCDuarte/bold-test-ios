//
//  GetCitiesByQueryUseCaseTest.swift
//  bold-testTests
//
//  Created by Daniel Crespo Duarte on 17/05/23.
//

import Combine
import Resolver
@testable import bold_test
import XCTest

class GetCitiesByQueryUseCaseTest: XCTestCase {
    private var sut: GetCitiesByQueryUseCase!
    @LazyInjected var weatherRepositories: WeatherRepositoriesType
    private var cancellable: AnyCancellable?
    private let query = ""
    
    override func setUpWithError() throws {
        Resolver.registerDomainMockServices()
        sut = .init(repository: Resolver.resolve(WeatherRepositoriesType.self))
    }
    
    override func tearDownWithError() throws {
        sut = nil
        cancellable = nil
        WeatherRepositoriesStub.error = nil
        WeatherRepositoriesStub.responseCities = nil
        WeatherRepositoriesStub.responseForecast = nil
    }
    
    func testGetCitiesByQueryUseCase_ResponseSuccess() {
        //Given
        let expectationFailure = expectation(description: "failure")
        let expectation = self.expectation(description: "Consume Web Service Response Expectation")
        expectationFailure.isInverted = true
        
        WeatherRepositoriesStub.responseCities = TestDomainConstants.cities
        
        //When
        cancellable = sut.execute(params: query)
            .sink { completion in
                guard case .failure(let error) = completion else { return }
                XCTFail(error.localizedDescription)
                expectationFailure.fulfill()
            } receiveValue: { response in
                // Then
                XCTAssertFalse(response.isEmpty)
                expectation.fulfill()
            }
        
        wait(for: [expectationFailure, expectation], timeout: 1)
        cancellable?.cancel()
    }
    
    func testGetCitiesByQueryUseCase_ResponseError() {
        //Given
        let expectationFailure = expectation(description: "failure")
        let expectation = self.expectation(description: "Consume Web Service Response Expectation")
        expectation.isInverted = true
        
        WeatherRepositoriesStub.error = NetworkError.emptyJson
        
        //When
        cancellable = sut.execute(params: query)
            .sink(
                receiveCompletion: { completion in
                    guard case .failure(let error) = completion else { return
                        XCTFail("completion is not a failure")
                    }
                    // Then
                    let jsonEmptyError = NetworkError.emptyJson.localizedDescription
                    XCTAssertEqual(error.localizedDescription, jsonEmptyError)
                    expectationFailure.fulfill()
                },
                receiveValue: { _ in
                    expectation.fulfill()
                })
        
        wait(for: [expectationFailure, expectation], timeout: 1)
        cancellable?.cancel()
    }
}
