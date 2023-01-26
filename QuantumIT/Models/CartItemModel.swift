//
//  CartItemModel.swift
//  QuantumIT
//
//  Created by Apoorv Verma on 26/01/23.
//

import Foundation

struct CartItem: Identifiable, Codable{
    let id: String
    let title: String
    let image: String
    let price: Double
    let originalPrice: Double
    let isCountable: Bool
    let quantity: Int?
    let weight: Float?
    
    init(Id: String = UUID().uuidString, Title: String, Image: String, Price: Double, OriginalPrice: Double, IsCountable: Bool, Quantity: Int = 1, Weight: Float = 0) {
        self.id = Id
        self.title = Title
        self.image = Image
        self.price = Price
        self.originalPrice = OriginalPrice
        self.isCountable = IsCountable
        if(IsCountable){
            self.quantity = Quantity
            self.weight = nil
        } else{
            self.quantity = nil
            self.weight = Weight
        }
    }
}
