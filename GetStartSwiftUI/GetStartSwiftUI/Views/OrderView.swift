//
//  OrderView.swift
//  GetStartSwiftUI
//
//  Created by Daramwar, Shubham Gangadhar on 06/11/24.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(order.items) { item in
                        HStack {
//                            Label(item.name, systemImage: "circle")
                            Label {
                                Text(item.name)
                            } icon: {
                                Image(item.thumbnailImage, bundle: nil)
                            }
                            .labelStyle(.titleAndIcon)

                            Spacer()
                            Text("$\(item.price)")
                        }
                        
                    }
                    .onDelete(perform: deleteItems)
                }
                
                Section {
                    NavigationLink("Place order") {
                        CheckOutView() // AAA
                    }
                }
            }
            .navigationTitle("Order")
            .toolbar(content: {
                EditButton()
            })
//            .navigationDestination(for: String.self) { value in
//                CheckOutView() // AAA
//            }
            
        }
        
    }
    
    func deleteItems(at offsets: IndexSet) {
        order.items.remove(atOffsets: offsets)
    }
}

#Preview {
    OrderView()
        .environmentObject(Order())
}
