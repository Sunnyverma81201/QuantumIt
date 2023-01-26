//
//  CartItemView.swift
//  QuantumIT
//
//  Created by Apoorv Verma on 26/01/23.
//

import SwiftUI


let sampleItem = CartItem(Title: "Google", Image: "google_logo", Price: 159.00, OriginalPrice: 200.00, IsCountable: true, Quantity: 2)


struct CartItemView: View {
    
    let item: CartItem
    
    var body: some View {
        VStack(alignment: .center, spacing: 5) {
            Image(item.image)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 100)
            VStack(alignment: .leading, spacing: 2) {
                HStack {
                    Text("₹ \(String(format: "%.2f", item.price))")
                    Text("₹ \(String(format: "%.2f", item.originalPrice))")
                        .strikethrough(true, color: .gray)
                        .foregroundColor(.gray)
                }
                Text(item.title)
                Text("\(item.isCountable ? String(item.quantity!) : "\(String(format: "%.2f", item.weight!))Kg")")
                    .foregroundColor(.black.opacity(0.7))
            }
        }
        .padding()
        .background(Color("cart_item_background"))
        .shadow(radius: 10)
    }
}

extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

struct CartItemView_Previews: PreviewProvider {
    
    static var previews: some View {
        CartItemView(item: sampleItem)
    }
}
