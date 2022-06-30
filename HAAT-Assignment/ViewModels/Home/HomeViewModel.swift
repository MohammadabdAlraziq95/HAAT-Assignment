//
//  HomeViewModel.swift
//  HAAT-Assignment
//
//  Created by Mo Raziq on 6/27/22.
//

import Foundation
import UIKit
class HomeViewModel {
    
    weak var homeDelegate: HomeDelegate!
    let mealService = MealService()
    func checkUserStatus() -> Bool {
        let logged = UserManager.shared.getUserLoggedin()
        return logged
    }
    func fetchMealsBrands() {
        mealService.getMealBrands { [self] result in
            switch result {
            case .success(let mealBrands):
                homeDelegate.updateBrandMealUI(brandMeals: mealBrands)
            case .failure:
                let mealBrands = MealBrandModel(error: true, msg: "no data", brands: [])
                homeDelegate.updateBrandMealUI(brandMeals: mealBrands)
            }
        }
    }
    func getCellSize(collectionSize: CGSize) -> CGSize {
        let width = (collectionSize.width / 3) - 10
        let height = collectionSize.height
        return CGSize(width: width, height: height)
    }
}
