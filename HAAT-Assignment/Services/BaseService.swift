//
//  BaseService.swift
//  HAAT-Assignment
//
//  Created by Mo Raziq on 6/27/22.
//

import Foundation
final class BaseService {
    static let shared = BaseService()
    private init() { }
    struct Constants {
        static let countriesApi = "https://countriesnow.space/api/v0.1/countries/info?returns=flag,unicodeFlag,dialCode"
        static let countryBaseImageURL = "https://upload.wikimedia.org/wikipedia/commons/"
    }
    enum APIError: Error {
        case noInternet
        case HTTPError(statusCode: Int)
        case serverError(message: String)
        case errorDecoding
        var description: String {
            switch self {
            case .noInternet:
                return "There is no internet connection."
            case .HTTPError(let statusCode):
                return "The call failed with HTTP code \(statusCode)."
            case .serverError(let message):
                return "The server responded with message \"\(message)\"."
            case .errorDecoding:
                return "The decoder cant decode your data."
            }
        }
    }
}
