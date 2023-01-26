//
//  CartsViewModel.swift
//  QuantumIT
//
//  Created by Apoorv Verma on 26/01/23.
//

import Foundation



class CartViewModel: ObservableObject{
    @Published var carts: [Cart] = [] {
        didSet{
            saveCarts()
        }
    }
    
    let cartKey: String = "carts_list"
    
    init(){
        getCarts()
    }
    
    func addCart(title: String, cartItems: [CartItem]){
        let newCart = Cart(cartName: title, cartItems: cartItems)
        carts.append(newCart)
    }
    
    func getCarts() {
        guard let data = UserDefaults.standard.data(forKey: cartKey) else {
            return
        }
        
        guard let savedCarts = try? JSONDecoder().decode([Cart].self, from: data) else {
            return
        }
        
        self.carts = savedCarts
    }
    
    func deleteCart(indexSet: IndexSet){
        carts.remove(atOffsets: indexSet)
    }
    
    func saveCarts() {
        if let encodeData = try? JSONEncoder().encode(carts) {
            UserDefaults.standard.set(encodeData, forKey: cartKey)
        }
    }
}
