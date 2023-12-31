//
//  SportToolBar.swift
//  Score++ Watch App
//
//  Created by Alvin Tsang on 2023-12-29.
//

import SwiftUI

struct SportToolBar: ToolbarContent {
    @Environment(SportData.self) var sportData
    @Binding var match: Match
    var selectedSport: Sport
    
    var body: some ToolbarContent {
        @Bindable var sportData = sportData
        
        ToolbarItem(placement: .topBarTrailing) {
            var sportIndex: Int {
                sportData.sports.firstIndex(where: { $0.id == selectedSport.id })!
            }
            
            FavoriteButton(isSet: $sportData.sports[sportIndex].isFavorite) {
                saveFavorite(sportData.sports[sportIndex].isFavorite, id: selectedSport.id)
            }
        }
        
        ToolbarItem(placement: .bottomBar) {
            Button("Reset Match", systemImage: "arrow.circlepath", role: .destructive) {
                match = Match.new()
            }
            .foregroundStyle(.red)
            .labelStyle(.iconOnly)
        }
    }
}
