//
//  MealBrandModel.swift
//  HAAT-Assignment
//
//  Created by Mo Raziq on 6/27/22.
//

import Foundation

// MARK: - MealBrandModel
struct MealBrandModel: Codable {
    let error: Bool
    let msg: String
    let brands: [Brand]
}

// MARK: - Datum
struct Brand: Codable {
    let title, subtitle: String
    let imageURL: String
    let meals: [Meal]

    enum CodingKeys: String, CodingKey {
        case title, subtitle
        case imageURL = "imageUrl"
        case meals
    }
}

// MARK: - Meal
public class Meal: NSObject, Codable {
    var title, price: String
    var imageURL: String
    init(title:String,  price:String, imageURL:String){
        self.title = title
        self.price = price
        self.imageURL = imageURL
    }
}
