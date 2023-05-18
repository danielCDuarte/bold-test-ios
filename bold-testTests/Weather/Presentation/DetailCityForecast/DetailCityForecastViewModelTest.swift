//
//  DetailCityForecastViewModelTest.swift
//  bold-testTests
//
//  Created by Daniel Crespo Duarte on 17/05/23.
//

import XCTest
import Resolver
@testable import bold_test

class DetailCityForecastViewModelTest: XCTestCase {
    private var sut: DetailCityForecastViewModel!
    
    override func setUp() {
        Resolver.registerPresentationMockServices()
        sut = DetailCityForecastViewModel(getForecastUseCase: Resolver.resolve(AnyUseCase<String, ForecastObject>.self))
    }
    
    override func tearDown() {
        GetForecastUseCaseStub.error = nil
        sut = nil
        super.tearDown()
    }
    
    func testOnAppear_WhenReturnSucces_ThenChangeStateForecastWasChanged() {
        // Given
        let expectation = XCTestExpectation(description: "get city forecast")
        GetForecastUseCaseStub.forecast = TestDomainConstants.forecast
        
        // When
        sut.onAppear(city: TestDomainConstants.city)
        
        // Then
        let result = XCTWaiter.wait(for: [expectation], timeout: 1.0)
        if result == XCTWaiter.Result.timedOut {
            XCTAssertNotNil(sut.state.forecast?.id)
        } else {
            XCTFail("Delay interrupted")
        }
    }
    
    func testOnAppear_WhenThereIsError_ThenChangeStateForecastWasChanged() {
        // Given
        let expectation = XCTestExpectation(description: "get city forecast")
        GetForecastUseCaseStub.error = NetworkError.serverError
        
        // When
        sut.onAppear(city: TestDomainConstants.city)
        
        // Then
        let result = XCTWaiter.wait(for: [expectation], timeout: 1.0)
        if result == XCTWaiter.Result.timedOut {
            XCTAssertTrue(sut.state.alert)
        } else {
            XCTFail("Delay interrupted")
        }
    }
    
    func testOnDisAppear_WhenThereIsChangeState_ThenStateEmptyViewDataWasChanged() {
        // When
        sut.onDisAppear()
        
        // Then
        XCTAssertFalse(sut.loading)
    }
}
