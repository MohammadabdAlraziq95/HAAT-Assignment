//
//  Double+Extension.swift
//  HAAT-Assignment
//
//  Created by Mo Raziq on 7/12/22.
//

import Foundation

extension Double {
    func rounded(toPlaces places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
