//
//  ForecatsMapperTest.swift
//  bold-testTests
//
//  Created by Daniel Crespo Duarte on 17/05/23.
//

@testable import bold_test
import XCTest

class ForecatsMapperTest: XCTestCase {
    override func setUpWithError() throws {
        
    }
    
    override func tearDownWithError() throws {
        
    }
    
    func testForecatsMapper_WhenInputIsFilled_ThenReturnObjectFilled() throws {
        // Given
        let input = TestDataConstants.forecastResponse
        // when
        let result = ForecatsMapper.map(input: input)
        // then
        XCTAssertEqual(result.forecast.forecastday.count, input.forecast.forecastday.count)
    }
}
