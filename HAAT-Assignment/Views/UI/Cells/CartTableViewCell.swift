//
//  CartTableViewCell.swift
//  HAAT-Assignment
//
//  Created by Mo Raziq on 6/27/22.
//
import UIKit

class CartTableViewCell: UITableViewCell {

    @IBOutlet weak var cartItemImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    weak var cartCellDelgate: CartCellDelgate?
    var cartItem: CartItemInfo?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func populateData(_ meal: CartItemInfo) {
        self.cartItem  = meal
        cartItemImage.getImageFromUrl(meal.imageURL!, completion: {_ in})
        titleLabel.text = meal.title
        subtitleLabel.text = meal.title
        priceLabel.text = "₪ " + meal.price!
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func deleteCartItemAction(_ sender: Any) {
        cartCellDelgate?.deleteCartItem(self.cartItem!)
    }
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
}
