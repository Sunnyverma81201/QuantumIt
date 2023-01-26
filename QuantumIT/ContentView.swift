//
//  ContentView.swift
//  QuantumIT
//
//  Created by Apoorv Verma on 24/01/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var vm = LoginViewModel()
    
    var body: some View {
        return Group {
            if vm.isLoggedIn {
                NavigationTabsView()
            } else {
                LoginView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
