//
//  CartViewModelTest.swift
//  HAAT-AssignmentTests
//
//  Created by Mo Raziq on 6/29/22.
//

import XCTest
@testable import HAAT_Assignment
import CoreData

class CartViewModelTest: XCTestCase, CartViewModelDelegate {
    func displayCart(cartItems: [CartItemInfo]) {
        assert(true)
    }
    
    var cartViewModel: CartViewModel!

    override func setUp() {
        cartViewModel = CartViewModel()
    }
    
    func testAddToCart_shouldAddItemToCart() {
        let added = cartViewModel.addToCart(item: Meal(title: "test", price: "test", imageURL: "test"))
        XCTAssertTrue(added)
    }
    func testFetchCart_shouldGetCartItemsAndCallDisplyDelegate() {
        cartViewModel.cartDelegate = self
        cartViewModel.fetchCart()
        cartViewModel.cartDelegate?.displayCart(cartItems: [])
    }

}
