//
//  MainView.swift
//  GetStartSwiftUI
//
//  Created by Daramwar, Shubham Gangadhar on 06/11/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
            OrderView()
                .tabItem {
                    Label("Order", systemImage: "square.and.pencil")
                }
            FavoriteView()
                .tabItem {
                    Label("Favorites", systemImage: "star.fill" )
                }
        }
    }
}

#Preview {
    MainView()
        .environmentObject(Order())
        .environmentObject(Favorites())
}
