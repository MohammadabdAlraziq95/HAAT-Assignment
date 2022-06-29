import Foundation
import UIKit
import CoreData

class CartViewModel: NSObject {
    var cartDelegate: CartViewModelDelegate?
    var cartItems: [CartItemInfo]?
    let coreDataManager = CoreDataManager.sharedInstance
    
    func addToCart(item: Meal) -> Bool {
       return coreDataManager.addToCart(item: item)
    }
    
    func deleteToCart(identifer: CartItemInfo) {
        coreDataManager.deleteToCart(identifer: identifer)
    }
    func fetchCart() {
        let result =  coreDataManager.fetchCart()
        cartDelegate?.displayCart(cartItems: result!)
    }
}
