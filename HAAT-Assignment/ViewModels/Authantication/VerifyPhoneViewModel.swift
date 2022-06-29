//
//  VerifyPhoneViewModel.swift
//  HAAT-Assignment
//
//  Created by Mo Raziq on 6/28/22.
//

import Foundation

class VerifyPhoneViewModel {
    
    lazy var authService = AuthService()
    weak var verifyDelegate: VerifyDelegate?
    
    func login(phoneNumber: String, authCode: String) {
        authService.loginWithPhone(phoneNumber, authCode) { log in
            self.verifyDelegate?.loggedIn(logged: log)
        }
    }
    func prepareAutCode(numbers: [String]) -> String {
        let code = numbers.joined()
        return code
    }
}
