import Foundation
import UIKit
import CoreData

class CartViewModel: NSObject {
    var cartDelegate: CartViewModelDelegate?
    var cartItems: [CartItemInfo]?
    let coreDataManager = CoreDataManager.sharedInstance
    
    func addToCart(_ item: Meal) -> Bool {
        return coreDataManager.addToCart(item)
    }
    
    func deleteToCart(_ identifer: CartItemInfo) {
        coreDataManager.deleteToCart(identifer)
    }
    func fetchCart() {
        let result =  coreDataManager.fetchCart()
        cartDelegate?.displayCart(result!)
    }
}
