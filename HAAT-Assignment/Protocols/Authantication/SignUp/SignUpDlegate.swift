//
//  signupDlegate.swift
//  HAAT-Assignment
//
//  Created by Mo Raziq on 6/27/22.
//

import Foundation

protocol SignUpDlegate: AnyObject {
    func updateCountriesUI(_ countries: CountriesModel)
}
