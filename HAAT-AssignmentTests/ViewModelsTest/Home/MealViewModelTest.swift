//
//  MealViewModelTest.swift
//  HAAT-AssignmentTests
//
//  Created by Mo Raziq on 6/29/22.
//

import XCTest
@testable import HAAT_Assignment

class MealViewModelTest: XCTestCase {

    var mealViewModel: MealViewModel!
    override func setUp() {
        mealViewModel = MealViewModel()
    }

    func testGetCellSize_shouldMatchGivenCellSize() {
        let collectionSize = CGSize(width: 180, height: 90)
        let cellSize =  mealViewModel.getCellSize(collectionSize)
        
        XCTAssertEqual(cellSize.width, 50)
        XCTAssertEqual(cellSize.height, 90)
        
    }
}
