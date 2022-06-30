//
//  AddToCartViewController.swift
//  HAAT-Assignment
//
//  Created by Mo Raziq on 6/27/22.
//

import UIKit

class AddToCartViewController: UIViewController {
    
    @IBOutlet weak var selectedMealImageView: UIImageView!
    @IBOutlet weak var selectedMealTitle: UILabel!
    @IBOutlet weak var selectedMealPrice: UILabel!
    var meal: Meal?
    let cartViewModel = CartViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    private func configureUI() {
        self.selectedMealTitle.text = meal!.title
        self.selectedMealPrice.text = "₪ " + meal!.price
        self.selectedMealImageView.getImageFromUrl(url: meal!.imageURL, completion: {_ in})
    }
    @IBAction func addToCartAction(_ sender: Any) {
        _ = cartViewModel.addToCart(item: self.meal!)
        self.dismiss()
    }
    @IBAction func dismissAction(_ sender: Any) {
        self.dismiss()
    }
    private func dismiss() {
        self.dismiss(animated: true)
    }
}
