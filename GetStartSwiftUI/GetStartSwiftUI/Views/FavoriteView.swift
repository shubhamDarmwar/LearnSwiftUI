//
//  FavoriteView.swift
//  GetStartSwiftUI
//
//  Created by Daramwar, Shubham Gangadhar on 07/11/24.
//

import SwiftUI

struct FavoriteView: View {
    @EnvironmentObject var favorites: Favorites
    var body: some View {
        List {
            ForEach(favorites.items) { item in
                ItemRow(item: item)
            }
        }
    }
}

#Preview {
    FavoriteView().environmentObject(Favorites())
}
