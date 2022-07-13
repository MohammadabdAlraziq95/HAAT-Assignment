//
//  Marker.swift
//  HAAT-Assignment
//
//  Created by Mo Raziq on 7/13/22.
//

import Foundation
import UIKit
struct Marker {
    var marker: UIImage
    var size: Int = 35
    var lat: Double
    var lng: Double
    var zIndex: Int32 = 0
    var currentLocation: Bool = false
}
