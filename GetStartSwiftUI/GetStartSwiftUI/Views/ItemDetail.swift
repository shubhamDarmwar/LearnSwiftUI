//
//  ItemDetail.swift
//  GetStartSwiftUI
//
//  Created by Daramwar, Shubham Gangadhar on 06/11/24.
//

import SwiftUI

struct ItemDetail: View {
    let item: MenuItem
    @State var sliderValue = 1.0
    @EnvironmentObject var order: Order
    @EnvironmentObject var favorites: Favorites
    var body: some View {
        ScrollView {
            VStack {
                ZStack(alignment: .bottomTrailing) {
                    Image(item.mainImage)
                        .resizable()
                        .scaledToFit()
                    HStack {
                        BorderedText(text: Text(Date(), style: .date))
                            .textCase(.uppercase)
                            .textSelection(.enabled)
                            .offset(CGSize(width: 5, height: -5))
                        Spacer()
                        BorderedText(text: Text(item.photoCredit))
                            .offset(CGSize(width: -5, height: -5))
                    }
                    .font(.caption)
                    
                }
                Text(item.description)
                    .padding()
//                    .lineLimit(5, reservesSpace: true)
                    .lineLimit(2...8)
                    .truncationMode(.middle)
                    .lineSpacing(8)
                    .fontDesign(.serif)
//                    .fontWidth(.compressed)
                    .tracking(1) // Character spacing
//                    .kerning(5) // character spacing
                Button("Order this") {
                    order.add(item: item)
                }
                .buttonStyle(.borderedProminent)
                Spacer()
                GeometryReader { geometry in
                    VStack {
                        HStack {
                            Text("\(sliderValue)")
                                .offset(CGSize(width: sliderValue / 100 * geometry.size.width, height: 0))
                            Spacer()
                        }
                        
                        Slider(value: $sliderValue, in: 0...100) {
                            
                        }
                    }
                }
                .frame(height: 70)
                VStack {
                    Text("Non sensitive content")
                        .padding(.all)
                    Text("1234 5678 9012 3456")
                        .privacySensitive()
                    
                }
                .redacted(reason: .privacy)
//                            .redacted(reason: .privacy) // for only privacySensitive content
//                            .redacted(reason: .placeholder) // for all other elements in container
                VStack {
                    Text(" **bold** text, *italic* text, and ***bold, italic*** text, ~~strikethrough~~.")
                        .padding(.all, 8)
                    Text("`Monospaced works too`")
                }
                Text("To Visit Apple: [click here](https://apple.com)") // BBB //Open link in safari
                    .padding(.all, 8)
                Link("Visit Apple again", destination: URL(string: "https://apple.com")!) // BBB
                    .padding(.all, 8)
                VStack {
                    Link(destination: URL(string: "https://apple.com")!) {
                        Image(systemName: "circle.fill")
                    }
                }
                .environment(\.openURL, OpenURLAction(handler: handleURL)) // Add handler function to handle url click, Comment this to open link in safari
            }
            .toolbar { // Add button to navigation bar
                Button("Add") {
                    favorites.items.append(item)
                }
                .foregroundStyle(.white.gradient)
                .background(.blue.gradient)
            }
        }
    }
    
    func handleURL(_ url: URL) -> OpenURLAction.Result {
            print("Handle \(url) somehow")
            return .handled
        }
}

struct BorderedText: View {
    let text: Text
    var body: some View {
        text
            .padding(4)
            .background(.black)
            .foregroundStyle(.white)
            .border(.white)
//            .font(.caption)
    }
}

#Preview {
    NavigationStack {
        ItemDetail(item: MenuItem.example).environmentObject(Order())
    }
}
