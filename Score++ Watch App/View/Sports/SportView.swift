//
//  SportDetail.swift
//  Score++ Watch App
//
//  Created by Alvin Tsang on 2023-12-27.
//

import SwiftUI

struct SportView: View {
    @State private var scores = Score(y: 0, o: 0)
    @State private var selectedPlayer = 1
    @State private var match = Match(y: 0, o: 0, winner: "")
    @Binding var selectedSport: Sport?
    
    var body: some View {
        if let selectedSport = selectedSport {
            NavigationStack {
                VStack {
                    if !match.winner.isEmpty {
                        Text("\(selectedSport.icon)\(match.winner) Win!")
                    } else {
                        MatchView(match: match, selectedSport: selectedSport)
                        
                        HStack {
                            ScoreView(playerScore: $scores.y, scores: $scores, match: $match, selectedSport: selectedSport)
                            
                            Text(":")
                                .font(.largeTitle)
                                .baselineOffset(6)
                            
                            ScoreView(playerScore: $scores.o, scores: $scores, match: $match, selectedSport: selectedSport)
                        }
                    }
                }
                .toolbar {
                    SportToolBar(scores: $scores, match: $match, selectedSport: selectedSport)
                }
            }
        }else {
            Text("No Sport Selected")
        }
    }
}

#Preview {
    let sportData = SportData()
    return SportView(selectedSport: .constant(sportData.sports[1]))
        .environment(sportData)
}
