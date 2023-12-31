//
//  MatchDetail.swift
//  Score++ Watch App
//
//  Created by Alvin Tsang on 2023-12-30.
//

import SwiftUI

struct MatchView: View {
    @Binding var match: Match
    var sport: Sport
    
    var body: some View {
        if match.winner.isEmpty {
            VStack {
                HStack {
                    Text("\(match.scores.teamOneScore)")
                        .font(.title)
                    Text(sport.icon)
                        .font(.title)
                    Text("\(match.scores.teamTwoScore)")
                        .font(.title)
                }
                
                ScoreView(scores: match.currentMatch)
            }
        } else {
            EmptyView()
        }
    }
}

#Preview {
    MatchView(match: .constant(Match(scores: Scores(teamOneScore: 2, teamTwoScore: 1), currentMatch: Scores.new(), winner: "")), sport: (SportData().sports[0]))
}
