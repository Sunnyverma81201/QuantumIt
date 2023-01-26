//
//  CartDisplayView.swift
//  QuantumIT
//
//  Created by Apoorv Verma on 26/01/23.
//

import SwiftUI

let sampleCartItems: [CartItem] = [
    CartItem(Title: "Facebook", Image: "facebook_logo", Price: 159.00, OriginalPrice: 200.00, IsCountable: true, Quantity: 2),
    CartItem(Title: "Google", Image: "google_logo", Price: 159.00, OriginalPrice: 200.00, IsCountable: true, Quantity: 2),
    CartItem(Title: "Facebook", Image: "facebook_logo", Price: 159.00, OriginalPrice: 200.00, IsCountable: true, Quantity: 2),
    CartItem(Title: "Google", Image: "google_logo", Price: 159.00, OriginalPrice: 200.00, IsCountable: true, Quantity: 2)
]
let sampleCart = Cart(cartName: "Mini Basket", cartItems: sampleCartItems)

struct CartDisplayView: View {
    let cart: Cart
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(cart.cartName)
                    .foregroundColor(.accentColor)
                    .underline()
                .textCase(.uppercase)
                Spacer()
                Text("(\(cart.itemsCount) Products)")
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(cart.cartItems){ CartItem in
                        CartItemView(item: CartItem)
                            .padding()
                    }
                }
                .padding([.all],5)
            }
            HStack(spacing: 10){
                Text("₹\(String(format: "%.2f",cart.totalPrice))")
                    .foregroundColor(.accentColor)
                Spacer()
                
                Button {
                    
                } label: {
                    Text("Delete Cart")
                }
                .padding([.top,.bottom],8)
                .padding(.horizontal)
                .foregroundColor(.white)
                .background(Color.accentColor)
                .cornerRadius(8)
                
                Button {
                    print("Hello")
                } label: {
                    Text("Checkout")
                }
                .padding([.top,.bottom],8)
                .padding(.horizontal)
                .foregroundColor(.white)
                .background(Color.accentColor)
                .cornerRadius(8)

            }
        }
        .padding()
        .background(Color("cart_item_background"))
        .shadow(radius: 8)
    }
}

struct CartDisplayView_Previews: PreviewProvider {
    static var previews: some View {
        CartDisplayView(cart: sampleCart)
    }
}
