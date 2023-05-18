//
//  CitiesMapperTest.swift
//  bold-testTests
//
//  Created by Daniel Crespo Duarte on 17/05/23.
//

@testable import bold_test
import XCTest

class CitiesMapperTest: XCTestCase {
    override func setUpWithError() throws {
        
    }
    
    override func tearDownWithError() throws {
        
    }
    
    func testCitiesMapper_WhenInputIsFilled_ThenReturnObjectFilled() throws {
        // Given
        let input = TestDataConstants.citiesResponse
        // when
        let result = CitiesMapper.map(input: input)
        // then
        XCTAssertEqual(result.count, input.count)
    }
}
