//
//  CartCellDelegate.swift
//  HAAT-Assignment
//
//  Created by Mo Raziq on 6/28/22.
//

import Foundation

protocol CartCellDelgate: AnyObject {
    func deleteCartItem(_ cartItem: CartItemInfo)
}
