//
//  UserManager.swift
//  HAAT-Assignment
//
//  Created by Mo Raziq on 6/27/22.
// Check if user logged in

import Foundation

class UserManager {
    
    static let shared = UserManager()
    private init() {}
    var isUserLoggedIn = false
    
    func setUserLoggedIn(_ logged: Bool) {
        let defaults = UserDefaults.standard
        self.isUserLoggedIn = logged
        defaults.set(logged, forKey: "userLogged")
    }
    func getUserLoggedin() -> Bool {
        let defaults = UserDefaults.standard
        let logged = defaults.bool(forKey: "userLogged")
        return logged
    }
    
}
