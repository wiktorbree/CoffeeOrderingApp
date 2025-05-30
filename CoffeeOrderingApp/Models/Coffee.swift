//
//  Coffee.swift
//  CoffeeOrderingApp
//
//  Created by Wiktor Bramer on 21/05/2025.
//

import Foundation

struct Coffee {
    
    let name: String
    let imageURL: String
    let price: Double
    
}

extension Coffee {
    static func all() -> [Coffee] {
        return [
            Coffee(name: "Cappuccino", imageURL: "Cappuccino", price: 2.5),
            Coffee(name: "Espresso", imageURL: "Espresso", price: 2.1),
            Coffee(name: "Regular", imageURL: "Regular", price: 1.0)
        ]
    }
}
