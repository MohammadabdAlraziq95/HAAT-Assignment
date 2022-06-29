//
//  SearchViewController.swift
//  HAAT-Assignment
//
//  Created by Mo Raziq on 6/29/22.
//

import UIKit

class SearchViewController: UIViewController {
    
    var searchItems: [Brand] = []
    var searchViewModel: SearchViewModel?
    @IBOutlet weak var resturantsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchViewModel = SearchViewModel()
        searchViewModel?.searchDelegate = self
    }
    
}
extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource,
                                UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.searchItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "searchCell", for: indexPath)
                as? MealBrandCollectionViewCell else { fatalError()}
        cell.populateData(mealData: self.searchItems[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let mealDetailsViewController = AppRouter.shared.getVcFromStoryboard("MealViewController", "Home") as? MealViewController {
            mealDetailsViewController.brandObject = self.searchItems[indexPath.row]
            self.navigationController!.pushViewController(mealDetailsViewController, animated: true)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return (self.searchViewModel?.getCellSize(collectionSize: self.resturantsCollectionView!.frame.size))!
    }
}
extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchViewModel!.searchMealBrand(searchText: searchText)
    }
}
extension SearchViewController: SearchDelegate {
    func updateBrandMealUI(brandMeals: [Brand]) {
        self.searchItems = brandMeals
        self.resturantsCollectionView.reloadData()
    }
}
