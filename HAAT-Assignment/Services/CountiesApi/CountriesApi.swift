//
//  CountriesApi.swift
//  HAAT-Assignment
//
//  Created by Mo Raziq on 6/27/22.
//

import Foundation
import Alamofire

class CountriesApi {
    
    func getAllCountries(completion: @escaping(Result<CountriesModel, BaseService.APIError>) -> Void) {
        let url = prepareUrl()
        
        AF.request(url, method: .get).responseJSON { respone in
            if let res = respone.response {
                if res.statusCode == 200 {
                    guard let data = respone.data else {
                        return
                    }
                    do {
                        let countries = try JSONDecoder().decode(CountriesModel.self, from: data)
                        completion(.success(countries))
                    } catch {
                        print(error.localizedDescription)
                        completion(.failure(BaseService.APIError.HTTPError(statusCode: res.statusCode)))
                    }
                }
            } else {
                completion(.failure(BaseService.APIError.serverError(message: "request timeout!")))
            }
        }
    }
    private func prepareUrl() -> String {
        let url = BaseService.Constants.countriesApi
        return url
    }
}
