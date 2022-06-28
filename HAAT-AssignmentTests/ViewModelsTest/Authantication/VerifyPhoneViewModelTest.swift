//
//  VerifyPhoneViewModelTest.swift
//  HAAT-AssignmentTests
//
//  Created by Mo Raziq on 6/29/22.
//

import XCTest
@testable import HAAT_Assignment

class VerifyPhoneViewModelTest: XCTestCase, VerifyDelegate {
    
    func loggedIn(logged: Bool) {
        XCTAssertFalse(logged)
    }
    
    var verifyPhoneViewModel: VerifyPhoneViewModel!

    override func setUp() {
        verifyPhoneViewModel = VerifyPhoneViewModel()
    }
    func testCheckLogin_expectedFalse() {
        
        verifyPhoneViewModel.login(phoneNumber: "+972592750327", authCode: "0000")
        sleep(5)
        verifyPhoneViewModel.verifyDelegate = self
        verifyPhoneViewModel.verifyDelegate?.loggedIn(logged: false)
    }
    func testCheckPrepareAutCode_ShouldEqualOutput() {
        
       let authCode = verifyPhoneViewModel.prepareAutCode(numbers: ["0", "0", "0", "0"])
        XCTAssertEqual(authCode, "0000")
    }
}
