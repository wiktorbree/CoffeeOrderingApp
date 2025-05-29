//
//  AddCoffeeOrderView.swift
//  CoffeeOrderingApp
//
//  Created by Wiktor Bramer on 28/05/2025.
//

import SwiftUI

struct AddCoffeeOrderView: View {
    
    @Binding var isPresented: Bool
    @ObservedObject private var addCoffeeOrderVM = AddCoffeeOrderViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(.backgroundBase)
                VStack {
                    Form {
                        Section(header: Text("INFORMATION").font(.body)) {
                            TextField("Name", text: self.$addCoffeeOrderVM.name)
                                .padding(15)
                                .listRowBackground(RoundedRectangle(cornerRadius: 25)
                                    .fill(Color.cardBackground)
                                    .shadow(color: .shadow, radius: 3, x: 0, y: 5)
                                    .padding(10)
                                )
                                .listRowSeparator(.hidden)
                        }
                        
                        Section(header: Text("SELECT COFFEE").font(.body)) {
                            ForEach(addCoffeeOrderVM.coffeeList, id:\.name) { coffee in
                                
                                CoffeeCellView(coffee: coffee, selection: self.$addCoffeeOrderVM.coffeeName)
                            }
                        }
                        Section(header: Text("SELECT SIZE").font(.body), footer: OrderTotalView(total: self.addCoffeeOrderVM.total)) {
                            Picker("", selection: self.$addCoffeeOrderVM.size) {
                                Text("Small").tag("Small")
                                Text("Medium").tag("Medium")
                                Text("Large").tag("Large")
                            }
                            .pickerStyle(SegmentedPickerStyle())
                            .padding(5)
                            .listRowBackground(RoundedRectangle(cornerRadius: 15)
                                .fill(Color.cardBackground)
                                .shadow(color: .shadow, radius: 3, x: 0, y: 5)
                                .padding(5)
                            )
                            .listRowSeparator(.hidden)
                            
                        }
                    }
                    .scrollContentBackground(.hidden)
                    
                    HStack {
                        Button("Place Order") {
                            self.addCoffeeOrderVM.placeOrder()
                            self.isPresented = false
                        }
                    }
                    .padding(EdgeInsets(top: 12, leading: 100, bottom: 12, trailing: 100))
                    .foregroundStyle(.cardBackground)
                    .background(.accent)
                    .cornerRadius(10)
                    
                }
                .background(.backgroundBase)
                
                .navigationBarTitle("Add Order")
            }
            
            
        }
    }
}

#Preview {
    AddCoffeeOrderView(isPresented: .constant(false))
}

struct CoffeeCellView: View {
    
    let coffee: CoffeeViewModel
    
    @Binding var selection: String
    
    var body: some View {
        HStack {
            Image(coffee.imageURL)
                .resizable()
                .frame(width: 80, height: 80)
                .cornerRadius(50)
            Text(coffee.name)
                .font(.title2)
                .padding(.leading, 20)
            Spacer()
            Image(systemName: self.selection == self.coffee.name ? "checkmark" : "")
                .padding()
        }.onTapGesture {
            self.selection = self.coffee.name
            
        }
        .padding(10)
        .listRowBackground(RoundedRectangle(cornerRadius: 25)
            .fill(Color.cardBackground)
            .shadow(color: .shadow, radius: 3, x: 0, y: 5)
            .padding(10)
        )
        .listRowSeparator(.hidden)
    }
}
