//
//  SearchViewModel.swift
//  HAAT-Assignment
//
//  Created by Mo Raziq on 6/29/22.
//
import Foundation
import UIKit
class SearchViewModel {
    
    weak var searchDelegate: SearchDelegate!
    let mealService = MealService()
    
    func searchMealBrand(_ searchText: String) {
        if searchText.count >= 2 {
            mealService.searchMeal(searchText) { [self] result in
                switch result {
                case .success(let brands):
                    DispatchQueue.main.async {
                        searchDelegate.updateBrandMealUI(brands)
                    }
                case .failure:
                    DispatchQueue.main.async {
                        searchDelegate.updateBrandMealUI([])
                    }
                }
            }
        }
    }
    func getCellSize(_ collectionSize: CGSize) -> CGSize {
        let width = (collectionSize.width / 2) - 10
        let height = width
        return CGSize(width: width, height: height)
    }
}
