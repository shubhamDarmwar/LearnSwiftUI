//
//  GetStartSwiftUIApp.swift
//  GetStartSwiftUI
//
//  Created by Daramwar, Shubham Gangadhar on 06/11/24.
//

import SwiftUI

@main
struct GetStartSwiftUIApp: App {
    @StateObject var order = Order()
    @StateObject var favorites = Favorites()
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
                .environmentObject(favorites)
        }
    }
}
