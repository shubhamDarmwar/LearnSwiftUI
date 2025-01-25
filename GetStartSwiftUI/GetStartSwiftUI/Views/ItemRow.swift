//
//  ItemRow.swift
//  GetStartSwiftUI
//
//  Created by Daramwar, Shubham Gangadhar on 06/11/24.
//

import SwiftUI

struct ItemRow: View {
    var item: MenuItem
    let colors: [String: Color] = ["D": .purple, "G": .black, "N": .red, "S": .blue, "V": .green]

    var body: some View {
        HStack {
            Image(item.thumbnailImage)
                .clipShape(.circle)
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.body)
                    .fontWeight(.bold)
                Text("$\(item.price)")
                    .font(.body)
            }
            Spacer()
                .background(.blue.gradient)
            ForEach(item.restrictions, id: \.self) { restriction in
                Text(restriction)
                    .font(.caption)
                    .fontWeight(.bold)
                    .padding(5)
                    .background(colors[restriction, default: .black])
                    .clipShape(.circle)
                    .foregroundStyle(.white)
            }
        }
        
    }
}

#Preview {
    ItemRow(item: MenuItem.example)
}
