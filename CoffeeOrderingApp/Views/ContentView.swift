//
//  ContentView.swift
//  CoffeeOrderingApp
//
//  Created by Wiktor Bramer on 21/05/2025.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var orderListVM = OrderListViewModel()
    
    @State private var showModal: Bool = false
    
    var body: some View {
        
        NavigationStack {
            OrderListView(orders: self.orderListVM.orders)
            
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Coffee Orders")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.cofffeeBrown)
                    }
                }
                .navigationBarItems(leading: Button(action: reloadOrders) {
                    Image(systemName: "arrow.clockwise.circle.fill")
                        .foregroundColor(.cofffeeBrown)
                        .font(.title2)
                    
                }, trailing: Button(action: showAddCoffeeOrderView) {
                    Image(systemName: "plus.circle.fill")
                        .foregroundStyle(.cofffeeBrown)
                        .font(.title2)
                })
            
                .sheet(isPresented: $showModal) {
                    AddCoffeeOrderView(isPresented: self.$showModal)
                }
                .toolbarBackground(.backgroundBase.opacity(0.5), for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private func reloadOrders() {
        self.orderListVM.fetchOrders()
    }
    
    private func showAddCoffeeOrderView() {
        self.showModal = true
    }
}

#Preview {
    ContentView()
}
