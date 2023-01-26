//
//  CartView.swift
//  QuantumIT
//
//  Created by Apoorv Verma on 24/01/23.
//

import SwiftUI

    


struct CartView: View {
    @EnvironmentObject var cartsviewmodel: CartViewModel
   
    var body: some View {
        ScrollView{
            ForEach(cartsviewmodel.carts){ cart in
                VStack {
                    CartDisplayView(cart: cart)
                }.padding()
            }
        }
        .onAppear{
//                to remove all previously added elements so view only loads desired elements
                cartsviewmodel.carts.removeAll()
//            to add sample items
                cartsviewmodel.addCart(title: "Mini Basket", cartItems: sampleCartItems)
                cartsviewmodel.addCart(title: "Test Carts", cartItems: sampleCartItems)
             
        }
    }
}
struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            CartView()
        }.environmentObject(CartViewModel())
    }
}
