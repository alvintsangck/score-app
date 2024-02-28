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
    @Binding var isSettingOn: Bool
    var selectedSport: Sport
    
    var body: some ToolbarContent {
        @Bindable var sportData = sportData
        var sportIndex: Int {
            sportData.sports.firstIndex(where: { $0.id == selectedSport.id })!
        }
        
        ToolbarItem(placement: .topBarTrailing) {
            FavoriteButton(isSet: $sportData.sports[sportIndex].isFavorite) {
                saveFavorite(sportData.sports[sportIndex].isFavorite, id: selectedSport.id)
            }
        }
        
        ToolbarItemGroup(placement: .bottomBar) {
            var sportIndex: Int {
                sportData.sports.firstIndex(where: { $0.id == selectedSport.id })!
            }
            
            Button("Setting", systemImage: "gear") {
                isSettingOn.toggle()
            }
            .sheet(isPresented: $isSettingOn, onDismiss:  {
                
                saveBackgroundColor(sportData.sports[sportIndex].backgroundColor, id: selectedSport.id)
            }){
                SettingsView(selectedColors: $sportData.sports[sportIndex].backgroundColor)
            }
            Button("Reset Match", systemImage: "arrow.circlepath", role: .destructive) {
                match = Match.new()
            }
            .foregroundStyle(.red)
            .labelStyle(.iconOnly)
        }
    }
}
