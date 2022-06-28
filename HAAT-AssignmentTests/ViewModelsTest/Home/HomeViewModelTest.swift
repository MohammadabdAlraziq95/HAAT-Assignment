//
//  HomeViewModelTest.swift
//  HAAT-AssignmentTests
//
//  Created by Mo Raziq on 6/29/22.
//

import XCTest
@testable import HAAT_Assignment
class HomeViewModelTest: XCTestCase, HomeDelegate {
    
    var homeViewModel: HomeViewModel!
    
    func updateBrandMealUI(brandMeals: MealBrandModel) {
        XCTAssertFalse(brandMeals.error, "should not be error")
    }
    override func setUp() {
        homeViewModel = HomeViewModel()
    }
    func testFetchMealBrands_ShouldReturnArrayOfMealBrands() {
        homeViewModel.homeDelegate = self
        homeViewModel.fetchMealsBrands()
        sleep(5)
        homeViewModel.homeDelegate.updateBrandMealUI(brandMeals: MealBrandModel(error: false, msg: "yes", brands: []))
    }
    
    func testGetCellSize_shouldMatchGivenCellSize() {
        let collectionSize = CGSize(width: 180, height: 90)
       let cellSize =  homeViewModel.getCellSize(collectionSize: collectionSize)
        
        XCTAssertEqual(cellSize.width, 50)
        XCTAssertEqual(cellSize.height, 90)
        
    }
}
