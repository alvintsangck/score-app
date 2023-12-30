//
//  SportDetail.swift
//  Score++ Watch App
//
//  Created by Alvin Tsang on 2023-12-27.
//

import SwiftUI

struct SportDetail: View {
    @State private var scores = Score(y: 0, o: 0)
    @State private var selectedPlayer = 1
    @State private var match = Score(y: 0, o: 0)
    @State private var matchWinner = ""
    @Binding var selectedSport: Sport?
    
    var body: some View {
        if let selectedSport = selectedSport {
            NavigationStack {
                VStack {
                    if !matchWinner.isEmpty {
                        Text("\(selectedSport.icon)\(matchWinner) Win!")
                    } else {
                        MatchDetail(match: match, selectedSport: selectedSport, matchWinner: matchWinner)
                        
                        HStack {
                            ScoreDetail(score: $scores.y, isSelected: selectedPlayer == 1) {
                                selectedPlayer = 1
                            }
                            
                            Text(":")
                                .font(.largeTitle)
                                .baselineOffset(6)
                            
                            ScoreDetail(score: $scores.o, isSelected: selectedPlayer == 2) {
                                selectedPlayer = 2
                            }
                        }
                        .scenePadding(.horizontal)
                    }
                }
                .toolbar {
                    SportToolBar(scores: $scores, match: $match, matchWinner: $matchWinner, selectedSport: selectedSport, selectedPlayer: $selectedPlayer)
                }
            }
        }else {
            Text("No Sport Selected")
        }
    }
}

#Preview {
    let sportData = SportData()
    return SportDetail(selectedSport: .constant(sportData.sports[1]))
        .environment(sportData)
}
