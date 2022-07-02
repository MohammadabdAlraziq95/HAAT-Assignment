//
//  MealCollectionViewCell.swift
//  HAAT-Assignment
//
//  Created by Mo Raziq on 6/27/22.
//

import UIKit

class MealCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var brandMealImage: UIImageView!
    @IBOutlet weak var titleBrandMealLabel: UILabel!
    @IBOutlet weak var priceMealLabel: UILabel!
    
    func populateData(_ mealData: Meal) {
        self.brandMealImage.getImageFromUrl(mealData.imageURL, completion: {_ in })
        self.titleBrandMealLabel.text = mealData.title
        self.priceMealLabel.text = "₪" + mealData.price
    }
}
