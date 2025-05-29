//
//  OrderListView.swift
//  CoffeeOrderingApp
//
//  Created by Wiktor Bramer on 26/05/2025.
//

import SwiftUI

struct OrderListView: View {
    
    let orders: [OrderViewModel]
    
    init(orders: [OrderViewModel]) {
        self.orders = orders
    }
    
    var body: some View {
        List {
            ForEach(self.orders, id: \.id) { order in
                HStack {
                    Image(order.coffeeName)
                        .resizable()
                        .frame(width: 80, height: 80)
                        .cornerRadius(50)
                    
                    VStack(alignment: .leading) {
                        Text(order.name)
                            .font(.title)
                            .foregroundStyle(.textPrimary)
                            .padding([.leading, .bottom], 10)
                        
                        HStack {
                            Text(order.coffeeName)
                                .font(.headline)
                                .padding([.leading, .trailing], 10)
                                .padding([.top, .bottom], 5)
                                .foregroundStyle(.textSecondary)
                                .cornerRadius(50)
                            Text(order.size)
                                .font(.headline)
                                .padding([.leading, .trailing], 20)
                                .padding([.top, .bottom], 5)
                                .background(.accent)
                                .foregroundStyle(.cardBackground)
                                .cornerRadius(50)
                        }
                    }
                }
            }
            .padding(10)
            .listRowBackground(RoundedRectangle(cornerRadius: 25)
                .fill(Color.cardBackground)
                .shadow(color: .shadow, radius: 3, x: 0, y: 5)
                .padding(10)
            )
            .listRowSeparator(.hidden)
            .listRowBackground(Color.clear)
        }
        .listStyle(.plain)
        .background(.backgroundBase)
    }
}

#Preview {
    OrderListView(orders: [OrderViewModel(order: Order(name: "Mary", size: "Medium", coffeeName: "Regular", total: 3.0))])
}
