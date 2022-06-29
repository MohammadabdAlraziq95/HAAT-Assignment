//
//  MealServiceTest.swift
//  HAAT-AssignmentTests
//
//  Created by Mo Raziq on 6/29/22.
//

import XCTest
@testable import HAAT_Assignment

class MealServiceTest: XCTestCase {
    var mealService: MealService!
    
    override func setUp() {
        
        mealService = MealService()
    }
    
    func test_fetch_meal_data_success() {
        
        let expectation = expectation(description: "CountriesApi")
        
        mealService.getMealBrands { result in
            guard case .success(let value) = result else {
                return XCTFail("Expected to be a success but got a failure with \(result)")
            }
            XCTAssertEqual(value.error, false)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 30)
    }
    
}
