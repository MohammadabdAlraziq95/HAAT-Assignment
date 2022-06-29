//
//  AuthServiceTest.swift
//  HAAT-AssignmentTests
//
//  Created by Mo Raziq on 6/29/22.
//

import XCTest
@testable import HAAT_Assignment

class AuthServiceTest: XCTestCase {
    
    var authService: AuthService!
    
    override func setUp() {
        
        authService = AuthService()
    }
    
    func test_fetch_login_success() {
        
        let expectation = expectation(description: "sucessLogin")
        
        authService.loginWithPhone("+972592750327", "0000") { logged in
            XCTAssertEqual(logged, true)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }
    func test_fetch_login_fali() {
        
        let expectation = expectation(description: "failLogin")
        
        authService.loginWithPhone("+972592750327", "1000") { logged in
            XCTAssertEqual(logged, false)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }
}
