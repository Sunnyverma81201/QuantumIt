//
//  CartModel.swift
//  QuantumIT
//
//  Created by Apoorv Verma on 26/01/23.
//

import Foundation

struct Cart: Identifiable, Codable{
    let id: String
    let cartName: String
    let cartItems: [CartItem]
    let totalPrice: Double
    let itemsCount: Int
    
    init(id: String = UUID().uuidString, cartName: String, cartItems: [CartItem]) {
        
        var TotalPrice:Double = 0.0
        
        self.id = id
        self.cartName = cartName
        self.cartItems = cartItems
        
//        Calculates the total amount of cart based on cartItems array
        for cartItem in cartItems {
            
            TotalPrice = TotalPrice + cartItem.price
        }
        
        self.totalPrice = TotalPrice
        self.itemsCount = cartItems.count
    }
}
