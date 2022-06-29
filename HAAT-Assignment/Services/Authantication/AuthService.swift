//
//  AuthService.swift
//  HAAT-Assignment
//
//  Created by Mo Raziq on 6/27/22.
//

import Foundation

class AuthService {
    
    func loginWithPhone(_ phoneNumber: String,_ authCode:String , completion: @escaping(Bool) -> Void) {
        
        do {
            if let bundlePath = Bundle.main.path(forResource: "Users", ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                let decoder = JSONDecoder()
                let userModel = try decoder.decode(UserModel.self, from: jsonData)
                let users = userModel.users.filter({($0.phoneNumber == phoneNumber && $0.authCode == authCode)})
                if users.isEmpty {
                    completion(false)
                } else {
                    completion(true)
                }
            }
        } catch {
            completion(false)
        }
    }
}
