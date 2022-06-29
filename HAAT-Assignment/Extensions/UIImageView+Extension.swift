//
//  UIImageView+Extensions.swift
//  HAAT-Assignment
//
//  Created by Mo Raziq on 6/27/22.
//

import UIKit
import Alamofire
import AlamofireImage
extension UIImageView {
    
    func getImageFromUrl(url: String, completion:@escaping(Bool) -> Void) {
        
        AF.request(url).responseImage {[weak self] response in
            
            switch response.result {
            case .success(let image):
                
                DispatchQueue.main.async {
                    self?.image = image
                }
                
                completion( true)
                
            case .failure:
                DispatchQueue.main.async {
                    if let image = UIImage(named: "default-image") {
                        self?.image = image
                    }
                }
                completion(false)
            }
        }
    }
}
