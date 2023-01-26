//
//  TabsView.swift
//  QuantumIT
//
//  Created by Apoorv Verma on 24/01/23.
//

import SwiftUI

struct NavigationTabsView: View {
    @State private var selectedItem = 1
    
    var body: some View {
        TabView(selection: $selectedItem) {
            NavigationView{
                HomeView()
                    .navigationTitle("Home")
                    .navigationBarTitleDisplayMode(.inline)
            }
                .tabItem{
                    Label("Home", systemImage: "house.fill")
                }.tag(1)
            
            NavigationView{
                SavedView()
                    .navigationTitle("Saved")
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarItems(
                        leading:
                            Button{
                                selectedItem = 2
                            } label: {
                                Image(systemName: "chevron.backward")
                            },
                        trailing:
                            Button{
                                selectedItem = 1
                            } label: {
                                Image(systemName: "house.fill")
                            }
                        )
            }.tabItem{
                    Label("Saved", systemImage: "heart.fill")
                }.tag(2)
            NavigationView{
                NotificationView()
                    .navigationTitle("Notifications")
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarItems(
                        leading:
                            Button{
                                selectedItem = 2
                            } label: {
                                Image(systemName: "chevron.backward")
                            },
                        trailing:
                            Button{
                                selectedItem = 1
                            } label: {
                                Image(systemName: "house.fill")
                            }
                    )
            }
                .tabItem{
                    Label("Notification", systemImage: "bell.fill")
                }.tag(3)
            
            NavigationView{
                ProfileView()
                    .navigationTitle("Profile")
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarItems(
                        leading:
                            Button{
                                selectedItem = 2
                            } label: {
                                Image(systemName: "chevron.backward")
                            },
                        trailing:
                            Button{
                                selectedItem = 1
                            } label: {
                                Image(systemName: "house.fill")
                            }
                    )
            }
                .tabItem{
                    Label("Profile", systemImage: "person.fill")
                }.tag(4)
            
            NavigationView{
                CartView()
                    .navigationTitle("Cart")
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarItems(
                        leading:
                            Button{
                                selectedItem = 2
                            } label: {
                                Image(systemName: "chevron.backward")
                            },
                        trailing:
                            Button{
                                selectedItem = 1
                            } label: {
                                Image(systemName: "house.fill")
                            }
                    )
            }.environmentObject(CartViewModel())
                .tabItem{
                    Label("Cart", systemImage: "cart.fill")
                }.tag(5)
        }
    }
}

struct NavigationTabsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationTabsView()
    }
}
