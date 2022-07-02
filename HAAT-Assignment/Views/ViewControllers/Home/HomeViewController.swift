//
//  HomeViewController.swift
//  HAAT-Assignment
//
//  Created by Mo Raziq on 6/27/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    var mealBrands: MealBrandModel?
    var homeViewModel: HomeViewModel?
    @IBOutlet weak var mealBrandsCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.homeViewModel = HomeViewModel()
        homeViewModel?.homeDelegate = self
        if self.homeViewModel!.checkUserStatus() == false {
            self.goToAuth()
        }
        mealBrands = MealBrandModel(error: true, msg: "no data", brands: [])
        fetchBrands()
    }
    private func fetchBrands() {
        self.homeViewModel?.fetchMealsBrands()
    }
    private func goToAuth() {
        if let authVc = AppRouter.shared.getVcFromStoryboard("AuthNavigation", "Authentication") as? AuthNavigation {
            self.navigationController!.present(authVc, animated: true)
        }
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource,
                              UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.mealBrands!.brands.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mealBrandCell", for: indexPath)
                as? MealBrandCollectionViewCell else { fatalError()}
        cell.populateData(self.mealBrands!.brands[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let mealDetailsViewController = AppRouter.shared.getVcFromStoryboard("MealViewController", "Home") as? MealViewController {
            mealDetailsViewController.brandObject = self.mealBrands?.brands[indexPath.row]
            self.navigationController!.pushViewController(mealDetailsViewController, animated: true)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return (self.homeViewModel?.getCellSize(self.mealBrandsCollectionView!.frame.size))!
    }
}

extension HomeViewController: HomeDelegate {
    
    func updateBrandMealUI(_ brandMeals: MealBrandModel) {
        self.mealBrands = brandMeals
        self.mealBrandsCollectionView.reloadData()
    }
}
