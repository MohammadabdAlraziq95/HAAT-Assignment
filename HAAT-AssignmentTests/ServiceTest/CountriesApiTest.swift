//
//  CountriesApiTest.swift
//  HAAT-AssignmentTests
//
//  Created by Mo Raziq on 6/29/22.
//

import XCTest
@testable import HAAT_Assignment

class CountriesApiTest: XCTestCase {
    
    var countriesService: CountriesApi!
    
    override func setUp() {
        
        countriesService = CountriesApi()
    }
    
    func test_fetch_countries_data_success() {
        
        let expectation = expectation(description: "CountriesApi")
        
        countriesService.getAllCountries { result in
            
            guard case .success(let value) = result else {
                return XCTFail("Expected to be a success but got a failure with \(result)")
            }
            XCTAssertEqual(value.error, false)
            expectation.fulfill()
        
        }
        wait(for: [expectation], timeout: 30)
    }
    
}
