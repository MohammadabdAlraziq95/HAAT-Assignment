//
//  CountryModel.swift
//  HAAT-Assignment
//
//  Created by Mo Raziq on 6/27/22.
//
import Foundation

// MARK: - CountriesModel
struct CountriesModel: Codable {
    let error: Bool
    let msg: String
    let data: [Datum]
}

// MARK: - Datum
struct Datum: Codable {
    let name, unicodeFlag: String
    let flag: String?
    let dialCode: String?
}
