//
//  CheckOutView.swift
//  GetStartSwiftUI
//
//  Created by Daramwar, Shubham Gangadhar on 07/11/24.
//

import SwiftUI

struct CheckOutView: View {
    let paymentTypes = ["Cash", "Credit card", "iDine Points"]
    @State private var paymentType = "Cash"
    
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    
    let tipAmounts = [10, 20, 30 ,0]
    @State var tipAmount = 1
    
    @EnvironmentObject var order: Order
    
    @State private var showingPaymentAlert = false
    
    var totalPrice: String {
        let total = Double(order.total)
        let tipValue = total / 100 * Double(tipAmount)
        return (total + tipValue).formatted(.currency(code: "USD"))
    }
    var body: some View {
        Form {
            Section {
                Picker("How you want to pay?", selection: $paymentType) {
                    ForEach(paymentTypes, id: \.self) { type in
                        Text(type)
                    }
                    
                }
                Toggle("Add iDine loyalty details", isOn: $addLoyaltyDetails.animation())
                if addLoyaltyDetails {
                    TextField("Enter your iDine Id", text: $loyaltyNumber)
                }
            }
            
            Section("Add tip?") {
                Picker("Tip Amount", selection: $tipAmount) {
                    ForEach(tipAmounts, id: \.self) { amount in
                        Text("\(amount)")
                    }
                }
                .pickerStyle(.segmented)
            }
            
            Section("Total: \(totalPrice)") {
                Button("Confirm order") {
                    showingPaymentAlert.toggle()
                }
            }
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Order Confirmed", isPresented: $showingPaymentAlert) {
            
        } message: {
            Text("Your total price was \(totalPrice) -thank you")
        }
    }
}

#Preview {
    CheckOutView().environmentObject(Order())
}
