//
//  ErrorGenerator.swift
//  HAAT-Assignment
//
//  Created by Mo Raziq on 6/28/22.
//

import Foundation

class ErrorGenerator {
    
    let errorArray = ["index out of range", "error in type", "your variable is nill", "no cart items found"]
    func generateError() -> String {
        return errorArray.randomElement()!
    }
}
