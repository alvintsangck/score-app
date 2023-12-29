//
//  SportDetail.swift
//  Score++ Watch App
//
//  Created by Alvin Tsang on 2023-12-27.
//

import SwiftUI

struct SportDetail: View {
    @Environment(SportData.self) var sportData
    @State private var scores = Score(y: 0, o: 0)
    @State private var selectedPlayer = 1
    @State private var match = Score(y: 0, o: 0)
    @State private var matchWinner = ""
    @Binding var selectedSport: Sport?
    
    var body: some View {
        if let selectedSport = selectedSport {
            @Bindable var sportData = sportData
            
            var sportIndex: Int {
                sportData.sports.firstIndex(where: { $0.id == selectedSport.id })!
            }
            
            NavigationStack {
                VStack {
                    if !matchWinner.isEmpty {
                        Text("\(selectedSport.icon)\(matchWinner) Win!")
                    } else {
                        HStack {
                            Text("\(match.y)")
                                .font(.title)
                            Text(selectedSport.icon)
                                .font(.title)
                            Text("\(match.o)")
                                .font(.title)
                        }
                        
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
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            resetScore()
                            resetMatch()
                        } label: {
                            Image(systemName: "arrow.circlepath")
                        }
                    }
                    
                    ToolbarItemGroup(placement: .bottomBar) {
                        if matchWinner.isEmpty {
                            Button {
                                if selectedPlayer == 1 {
                                    scores.y = max(scores.y - 1, 0)
                                } else {
                                    scores.o = max(scores.o - 1, 0)
                                }
                            } label: {
                                Image(systemName: "minus")
                            }
                        }
                        
                        FavoriteButton(isSet: $sportData.sports[sportIndex].isFavorite)
                        
                        if matchWinner.isEmpty {
                            Button {
                                addScore()
                                
                                let winner = checkScore(from: selectedSport, scores: scores)
                                
                                if winner == 1 {
                                    match.y += 1
                                    resetScore()
                                } else if winner == 2 {
                                    match.o += 1
                                    resetScore()
                                }
                                
                                matchWinner =  selectedSport.checkWinner(match: match)
                                
                            } label: {
                                Image(systemName: "plus")
                            }
                        }
                    }
                }
            }
        } else {
            Text("No Sport Selected")
        }
    }
    
    fileprivate func addScore() {
        if selectedPlayer == 1 {
            scores.y += 1
        } else {
            scores.o += 1
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
}

#Preview {
    let sportData = SportData()
    return SportDetail(selectedSport: .constant(sportData.sports[1]))
        .environment(sportData)
}
