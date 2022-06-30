//
//  File.swift
//  HAAT-Assignment
//
//  Created by Mo Raziq on 6/28/22.
//

import Foundation
import UIKit

class AppRouter {
    static let shared = AppRouter()
    private init() { }
    func getVcFromStoryboard(_ vcName:String,_  sbName:String) -> UIViewController {
        let storyboard = UIStoryboard(name: sbName, bundle: nil)
        let viewcontroller = storyboard.instantiateViewController(withIdentifier: vcName)
        return viewcontroller
    }
}
