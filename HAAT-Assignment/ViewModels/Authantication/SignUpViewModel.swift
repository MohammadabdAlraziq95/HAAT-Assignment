//
//  SignUpViewModel.swift
//  HAAT-Assignment
//
//  Created by Mo Raziq on 6/27/22.
//

import Foundation

class SignUpViewModel {
    
    let countriesApi = CountriesApi()
    weak var signUpDelegate: SignUpDlegate?
    var countries: CountriesModel?
    
    func getCountries() {
        countriesApi.getAllCountries { [weak self] result in
            switch result {
            case .success(let countries):
                self?.signUpDelegate!.updateCountriesUI(countries)
                self?.countries = countries
            case .failure:
                let countries = CountriesModel(error: true, msg: "No Countries Found", data: [])
                self?.signUpDelegate!.updateCountriesUI(countries)
            }
        }
    }
    func checkPhoneNumberValidation(_ phoneNumber: String) -> Bool {
        return phoneNumber.isValidPhone()
    }
    func preparePhoneNumber(_ intro: String, _ number: String) -> String {
        var fullPhoneNumber = intro + number
        fullPhoneNumber.removeFirst()
        let phone = String(fullPhoneNumber).trimmingCharacters(in: .whitespaces)
        return String(phone)
    }
    
}
