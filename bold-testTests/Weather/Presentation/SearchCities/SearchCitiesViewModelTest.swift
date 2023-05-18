//
//  SearchCitiesViewModelTest.swift
//  bold-testTests
//
//  Created by Daniel Crespo Duarte on 17/05/23.
//

import XCTest
import Resolver
@testable import bold_test

class SearchCitiesViewModelTest: XCTestCase {
    private var sut: SearchCitiesViewModel!
    
    override func setUp() {
        Resolver.registerPresentationMockServices()
        sut = SearchCitiesViewModel(getCitiesByQueryUseCase: Resolver.resolve(AnyUseCase<String, [CityObject]>.self))
    }
    
    override func tearDown() {
        GetCitiesByQueryUseCaseStub.error = nil
        sut = nil
        super.tearDown()
    }
    
    func testSearchCity_WhenReturnSucces_ThenChangeStateCitiesWasChanged() {
        // Given
        let expectation = XCTestExpectation(description: "get Cities")
        GetCitiesByQueryUseCaseStub.cities = TestDomainConstants.cities
        
        // When
        sut.searchCity(query: "London")
        
        // Then
        let result = XCTWaiter.wait(for: [expectation], timeout: 1.0)
        if result == XCTWaiter.Result.timedOut {
            XCTAssertFalse(sut.state.cities.isEmpty)
        } else {
            XCTFail("Delay interrupted")
        }
    }
    
    func testSearchCity_WhenThereIsError_ThenChangeStateCitiesWasChanged() {
        // Given
        let expectation = XCTestExpectation(description: "get Recipes")
        GetCitiesByQueryUseCaseStub.error = NetworkError.serverError
        
        // When
        sut.searchCity(query: "London")
        
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
