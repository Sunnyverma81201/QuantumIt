//
//  HomeView.swift
//  QuantumIT
//
//  Created by Apoorv Verma on 24/01/23.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var vm = LoginViewModel()
    
    var body: some View {
        Button("Logout") {
            Task {
                await vm.signOut()
            }
        }
        .padding()
        .background(Color.accentColor)
        .foregroundColor(.white)
        .cornerRadius(10)

    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
