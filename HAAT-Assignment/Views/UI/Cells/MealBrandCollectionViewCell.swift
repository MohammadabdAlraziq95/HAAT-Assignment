//
//  mealBrandCollectionViewCell.swift
//  HAAT-Assignment
//
//  Created by Mo Raziq on 6/27/22.
//

import UIKit

class MealBrandCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var brandMealImage: UIImageView!
    @IBOutlet weak var titleBrandMeal: UILabel!
    @IBOutlet weak var subtitleBrandMeal: UILabel!
    
    func populateData(mealData: Brand) {
        self.brandMealImage.getImageFromUrl(url: mealData.imageURL, completion: {_ in })
        self.titleBrandMeal.text = mealData.title
        self.subtitleBrandMeal.text = mealData.subtitle
    }
}
