//
//  SportList.swift
//  Score++ Watch App
//
//  Created by Alvin Tsang on 2023-12-27.
//

import SwiftUI

struct SportList: View {
    @Environment(SportData.self) var sportData
    @State private var showFavoritesOnly = false
    @State private var selected: Sport?
    
    var filteredSports : [Sport] {
        sportData.sports.filter { sport in
            (!showFavoritesOnly || sport.isFavorite)
        }.sorted(by: { $0.name < $1.name })
    }
    
    var body: some View {
        NavigationSplitView {
            List(selection: $selected) {
                Toggle("Favorites only", isOn: $showFavoritesOnly.animation())
                
                ForEach (filteredSports) {sport in
                    NavigationLink(value: sport) {
                        SportRow(sport: sport)
                    }
                }
            }
            .listStyle(.carousel)
        } detail: {
            // TODO: fix rerender
            TabView(selection: $selected) {
                ForEach(filteredSports) { sport in
                    SportView(sport: sport)
                        .tag(Optional(sport))
                }
            }
        }
        .tabViewStyle(.verticalPage)
    }
}

#Preview {
    SportList()
        .environment(SportData())
}
