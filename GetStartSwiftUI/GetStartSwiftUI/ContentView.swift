//
//  ContentView.swift
//  GetStartSwiftUI
//
//  Created by Daramwar, Shubham Gangadhar on 06/11/24.
//

import SwiftUI

struct ContentView: View {
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
//    var body: some View {
//        NavigationView {
//            List {
//                ForEach(menu) { section in
//                    Section {
//                        ForEach(section.items) { item in
////                            NavigationLink {
////                                ItemDetail(item: item)
////                            } label: {
////                                Text("\(item.name)")
////                            }
//                            NavigationLink(item.name) {
//                                ItemDetail(item: item)
//                            }
//                        }
//                    }
//                }
//            }
//            .navigationTitle("Title")
//            .navigationBarTitleDisplayMode(.inline)
//            .listStyle(.grouped) // .insetGrouped
//        }
//    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(menu) { section in
                    Section {
                        ForEach(section.items) { item in
                            NavigationLink(value: item) {
                                ItemRow(item: item)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Title")
            .navigationBarTitleDisplayMode(.large)
            .listStyle(.grouped) // .insetGrouped
            .navigationDestination(for: MenuItem.self) { item in
                ItemDetail(item: item)
            }
        }
    }
}

#Preview {
    ContentView()
}

// NavigationView vs NavigationStack

/*
 NavigationView works in conjunction with NavigationLink by wrapping the content of the views, allowing users to link the next view.
 
 NavigationView {
             List(cars) { car in
                 NavigationLink(car.rawValue) {
                     CarDetailView(car: car)
                 }
             }
             .navigationBarTitleDisplayMode(.inline)
             .navigationTitle(viewType.title)
         }
 */

/*
 iOS 16
 - no longer need to create individual views for each screen in the navigation flow, making our code more concise and easier to maintain.
 - works in conjunction with navigationDestination
 - allowing multiple navigationDestination view modifiers for different value types
 NavigationStack {
             List(cars) { car in
                 NavigationLink(car.rawValue, value: car)
             }
             .navigationBarTitleDisplayMode(.inline)
             .navigationTitle(viewType.title)
             .navigationDestination(for: Car.self) { car in
                 CarDetailView(car: car)
             }
 */
