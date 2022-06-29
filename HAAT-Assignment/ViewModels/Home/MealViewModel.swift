//
//  MealViewModel.swift
//  HAAT-Assignment
//
//  Created by Mo Raziq on 6/27/22.
//

import Foundation
import UIKit
class MealViewModel {
    func getCellSize(collectionSize: CGSize) -> CGSize {
        let width = (collectionSize.width / 3) - 10
        let height = collectionSize.height
        return CGSize(width: width, height: height)
    }
}
