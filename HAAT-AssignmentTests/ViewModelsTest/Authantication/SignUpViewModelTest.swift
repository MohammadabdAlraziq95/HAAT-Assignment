//
//  SignUpViewModelTest.swift
//  HAAT-AssignmentTests
//
//  Created by Mo Raziq on 6/28/22.
//

import XCTest
@testable import HAAT_Assignment

class SignUpViewModelTest: XCTestCase, SignUpDlegate {
    
    func updateCountriesUI(_ countries: CountriesModel) {
        XCTAssertTrue(countries.error == false, "should no error here")
    }
    var signUpViewModel: SignUpViewModel!
    
    override func setUp() {
        signUpViewModel = SignUpViewModel()
    }
    func testIfGetCountrisWorkingWell_ShouldReturnArrayOFCountries() {
        
        signUpViewModel.getCountries()
        sleep(2)
        signUpViewModel.signUpDelegate = self
        signUpViewModel.signUpDelegate?.updateCountriesUI(CountriesModel(error: false, msg: "no error", data: []))
        
    }
    func testPhoneNumberValidation_ValidationShouldReturnFalse() {
        let validationResult = signUpViewModel.checkPhoneNumberValidation("972592750327")
        XCTAssertFalse(validationResult, "For Number Not Start With + , Should Return False")
    }
    func testPhoneNumberValidationLength_ValidationShouldReturnFalse() {
        let validationResult = signUpViewModel.checkPhoneNumberValidation("+972592750327755321")
        XCTAssertFalse(validationResult, "More than 12 number , Should Return False")
    }
}
