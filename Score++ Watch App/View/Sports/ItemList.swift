//
//  ItemList.swift
//  Score++ Watch App
//
//  Created by Alvin Tsang on 2023-12-31.
//

import SwiftUI

enum Item: String, CaseIterable {
    case first
    case second
    case thrid
    case forth
}

struct ItemList: View {
    @State private var showFavoritesOnly = false
    @State var selected: Item?
    
    var body: some View {
        NavigationSplitView() {
            List(selection: $selected) {
                ForEach(Item.allCases, id: \.self) { item in
                    NavigationLink(item.rawValue.uppercased(),
                                   value: item)
                }
            }
            .listStyle(.carousel)
            //            .toolbar{
            //                ToolbarItem(placement: .confirmationAction) {
            //                    Button("show favorites", systemImage: showFavoritesOnly ? "star.fill" : "star") {
            //                        showFavoritesOnly.toggle()
            //                    }
            //                    .labelStyle(.iconOnly)
            //                    .foregroundStyle(.yellow)
            //                }
            //            }
        } detail: {
            TabView(selection: $selected) {
                ForEach(Item.allCases, id: \.self) { item in
                    Text("\(item.rawValue) tab view")
                        .tag(Optional(item))
                        .toolbar {
                            ToolbarItem(placement: .confirmationAction) {
                                Button("show favorites", systemImage: showFavoritesOnly ? "star.fill" : "star") {
                                    showFavoritesOnly.toggle()
                                }
                                .labelStyle(.iconOnly)
                                .foregroundStyle(.yellow)
                            }
                            
                            
                            ToolbarItem(placement: .bottomBar) {
                                Button("Reset Match", systemImage: "arrow.circlepath") {
                                }
                                .foregroundStyle(.red)
                                .labelStyle(.iconOnly)
                            }
                        }
                }
            }
            .tabViewStyle(.verticalPage)}
    }
}

#Preview {
    ItemList()
}
