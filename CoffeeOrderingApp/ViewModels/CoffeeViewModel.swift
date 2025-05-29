//
//  CoffeeViewModel.swift
//  CoffeeOrderingApp
//
//  Created by Wiktor Bramer on 28/05/2025.
//

import Foundation

class CoffeeListViewModel {
    
    var cofffeeList: [CoffeeViewModel] = [CoffeeViewModel]()
    
}

struct CoffeeViewModel {
    var coffee: Coffee
    
    init(coffee: Coffee) {
        self.coffee = coffee
    }
    
    var name: String {
        return self.coffee.name
    }
    
    var imageURL: String {
        return self.coffee.imageURL
    }
    
    var price: Double {
        return self.coffee.price
    }
}
