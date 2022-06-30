//
//  CartDelegate.swift
//  HAAT-Assignment
//
//  Created by Mo Raziq on 6/28/22.
//

import Foundation

protocol CartViewModelDelegate: AnyObject {
  func displayCart(cartItems: [CartItemInfo])
}
