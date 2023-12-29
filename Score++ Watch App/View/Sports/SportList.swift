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
    @State private var selectedSport: Sport?
    
    var filteredSports : [Sport] {
        sportData.sports.filter { sport in
            (!showFavoritesOnly || sport.isFavorite)
        }
    }
    
    var body: some View {
        NavigationSplitView {
            List(selection: $selectedSport) {
                Toggle("Favorites only", isOn: $showFavoritesOnly.animation())
                
                ForEach (filteredSports) {sport in
                    NavigationLink(value: sport) {
                        SportRow(sport: sport)
                    }
                }
            }
            .listStyle(.carousel)
        } detail: {
//            TabView(selection: $selectedSport) {
//                ForEach(filteredSports) { sport in
                    SportDetail(selectedSport: $selectedSport)
//                        .tag(Optional(sport))
                .containerBackground(.red.gradient, for: .navigation)
//                }
//            }
        }
//        .tabViewStyle(.verticalPage)
    }
}

#Preview {
    SportList()
        .environment(SportData())
}
