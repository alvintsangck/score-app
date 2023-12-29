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
    
    var filteredSports : [any Sport] {
        sportData.sports.filter { sport in
            (!showFavoritesOnly || sport.isFavorite)
        }
    }
    
    var body: some View {
        NavigationSplitView {
            List {
                Toggle("Favorites only", isOn: $showFavoritesOnly.animation())
                
                ForEach (filteredSports, id: \.id) {sport in
                    NavigationLink {
                        SportDetail(selectedSport: sport)
                    } label: {
                        SportRow(sport: sport)
                    }
                }
            }
            .listStyle(.carousel)
        } detail: {
            Text("Select Sport")
            //            TabView(selection: $selected) {
            //                ForEach(filteredSports) { sport in
            //                    SportDetail(selectedSport: $selected)
            //                        .tag(Optional(sport))
            //                        .containerBackground(.background, for: .tabView)
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
