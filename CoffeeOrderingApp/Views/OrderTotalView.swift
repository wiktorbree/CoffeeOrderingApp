//
//  OrderTotalView.swift
//  CoffeeOrderingApp
//
//  Created by Wiktor Bramer on 28/05/2025.
//

import SwiftUI

struct OrderTotalView: View {
    
    let total: Double
    
    var body: some View {
        HStack (alignment: .center){
            Spacer()
            Text(String(format: "%.2f zł", self.total)).font(.title)
                .foregroundStyle(.accent)
            Spacer()
        }.padding(10)
    }
}

#Preview {
    OrderTotalView(total: 45.67)
}
