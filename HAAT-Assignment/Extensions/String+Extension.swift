//
//  UIString+Extension.swift
//  HAAT-Assignment
//
//  Created by Mo Raziq on 6/28/22.
//

import Foundation
extension String {
    func isValidPhone() -> Bool {
        let regEx = "^\\+(?:[0-9]?){6,14}[0-9]$"
        let phoneCheck = NSPredicate(format: "SELF MATCHES[c] %@", regEx)
        return phoneCheck.evaluate(with: self)
    }
}
