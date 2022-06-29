//
//  MealService.swift
//  HAAT-Assignment
//
//  Created by Mo Raziq on 6/27/22.
//

import Foundation

class MealService {
    
    func getMealBrands(completion: @escaping(Result<MealBrandModel, BaseService.APIError>) -> Void) {
        
        do {
            if let bundlePath = Bundle.main.path(forResource: "MealBrands", ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                let decoder = JSONDecoder()
                let mealBrandModel = try decoder.decode(MealBrandModel.self, from: jsonData)
                completion(.success(mealBrandModel) )
            }
        } catch {
            print(error)
        }
    }
    func searchMeal(searchText: String,completion: @escaping(Result<[Brand], BaseService.APIError>) -> Void) {
        
        do {
            if let bundlePath = Bundle.main.path(forResource: "MealBrands", ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                let decoder = JSONDecoder()
                let mealBrandModel = try decoder.decode(MealBrandModel.self, from: jsonData)
                let foundBrands = mealBrandModel.brands.filter({$0.title.contains(searchText) })
                completion(.success(foundBrands) )
            }
        } catch {
            print(error)
        }
    }
    
}
