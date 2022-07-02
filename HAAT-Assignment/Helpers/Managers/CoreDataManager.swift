//
//  CoreDataManager.swift
//  HAAT-Assignment
//
//  Created by Mo Raziq on 6/27/22.
//

import Foundation
import UIKit
import CoreData

open class CoreDataManager: NSObject {
    
    public static let sharedInstance = CoreDataManager()
    
    private override init() {}
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    func addToCart(_ item: Meal) -> Bool {
        let context  = appDelegate!.persistentContainer.viewContext
        let itemCart = CartItemInfo(context: context)
        itemCart.title = item.title
        itemCart.price = item.price
        itemCart.imageURL = item.imageURL
        itemCart.uuid = UUID()
        do {
            try context.save()
            print("save done")
            return true
        } catch let error as NSError {
            print(error)
            return false
        }
    }
    
    func deleteToCart(_ identifer: CartItemInfo) {
        let context  = appDelegate!.persistentContainer.viewContext
        do {
            context.delete(identifer)
            try context.save()
        } catch let error as NSError {
            print(error)
        }
    }
    
    func fetchCart() -> [CartItemInfo]? {
        let context  = appDelegate!.persistentContainer.viewContext
        let itemCartRequest = CartItemInfo.fetchRequest()
        do {
            let result = try context.fetch(itemCartRequest)
            return result
        } catch {
            print("Fail")
            return []
        }
    }
    
}
