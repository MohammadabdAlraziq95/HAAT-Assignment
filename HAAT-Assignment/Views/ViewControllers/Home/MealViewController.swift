//
//  MealViewController.swift
//  HAAT-Assignment
//
//  Created by Mo Raziq on 6/27/22.
//

import UIKit

class MealViewController: UIViewController {
    
    @IBOutlet weak var openButton: UIButton!
    @IBOutlet weak var mealImageView: UIImageView!
    @IBOutlet weak var timeButton: UIButton!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var brandTitleLabel: UILabel!
    @IBOutlet weak var brandSubTitleLabel: UILabel!
    @IBOutlet weak var mealsCollectionView: UICollectionView!
    
    var brandObject: Brand?
    var mealViewModel: MealViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mealViewModel = MealViewModel()
        self.populateData()
    }
    
    private func showMeal(meal: Meal) {
        
        if let addToCardViewController =  AppRouter.shared.getVcFromStoryboard("AddToCartViewController", "Home") as? AddToCartViewController {
            addToCardViewController.meal = meal
            self.present(addToCardViewController, animated: true)
        }
    }
    private func populateData() {
        self.brandTitleLabel.text = self.brandObject?.title
        self.brandSubTitleLabel.text = self.brandObject?.subtitle
        self.mealImageView.getImageFromUrl(url: self.brandObject!.imageURL, completion: {_ in})
    }
}

extension MealViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return brandObject!.meals.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mealCell", for: indexPath)
                as? MealCollectionViewCell else { fatalError()}
        cell.populateData(mealData: self.brandObject!.meals[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return mealViewModel.getCellSize(collectionSize: mealsCollectionView.frame.size)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        showMeal(meal: self.brandObject!.meals[indexPath.row])
    }
}
