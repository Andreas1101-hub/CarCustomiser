//
//  Car.swift
//  CarCustomiser
//
//  Created by Andreas Kwong on 11/01/2024.
//

import Foundation

struct Car {
    let make: String
    let model: String
    var topSpeed: Int
    var acceleration: Double
    var handling: Int
    
    func displayStats() -> String {
        return """
Make: \(make)
Model: \(model)
Top Speed: \(topSpeed)mph
Acceleration (0-60): \(acceleration)s
Handling: \(handling)
"""
    }
}

//struct displayStats {
//    let makeDisplay: String
//    let modelDisplay: String
//    let topSpeedDisplay: String
//    let accelerationDisplay: String
//    let handlingDisplay: String
//}
