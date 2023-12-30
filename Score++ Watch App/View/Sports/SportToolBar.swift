//
//  SportToolBar.swift
//  Score++ Watch App
//
//  Created by Alvin Tsang on 2023-12-29.
//

import SwiftUI

struct SportToolBar: ToolbarContent {
    @Environment(SportData.self) var sportData
    @Binding var scores: Score
    @Binding var match: Score
    @Binding var matchWinner: String
    var selectedSport: Sport
    @Binding var selectedPlayer: Int
    
    fileprivate func addScore() -> Void {
        if selectedPlayer == 1 {
            scores.y += 1
        } else {
            scores.o += 1
        }
    }
    
    fileprivate func minusScore() -> Void {
        if selectedPlayer == 1 {
            scores.y = max(0, scores.y - 1)
        } else {
            scores.o = max(0, scores.o - 1)
        }
    }
    
    fileprivate func resetScore() -> Void {
        scores.y = 0
        scores.o = 0
    }
    
    fileprivate func resetMatch() -> Void {
        match.y = 0
        match.o = 0
        matchWinner = ""
    }
    
    fileprivate func checkMatch(of sport: Sport) {
        let winner = checkScore(from: sport, scores: scores)
        if winner == 1 {
            match.y += 1
            resetScore()
        } else if winner == 2 {
            match.o += 1
            resetScore()
        }
    }
    
    var body: some ToolbarContent {
            @Bindable var sportData = sportData
            
            ToolbarItem(placement: .topBarTrailing) {
                Button("Reset Match", systemImage: "arrow.circlepath", role: .destructive) {
                    resetScore()
                    resetMatch()
                }
                .labelStyle(.iconOnly)
                .foregroundStyle(.red)
            }
            
            ToolbarItemGroup(placement: .bottomBar) {
                if matchWinner.isEmpty {
                    Button("Minus Score", systemImage: "minus", action: minusScore)
                        .labelStyle(.iconOnly)
                }
                
                var sportIndex: Int {
                    sportData.sports.firstIndex(where: { $0.id == selectedSport.id })!
                }
                
                FavoriteButton(isSet: $sportData.sports[sportIndex].isFavorite) {
                    save(sportData.sports)
                }
                
                if matchWinner.isEmpty {
                    Button("Add Score", systemImage: "plus") {
                        addScore()
                        checkMatch(of: selectedSport)
                        matchWinner = selectedSport.checkWinner(match: match)
                    }
                }
            }
    }
}
