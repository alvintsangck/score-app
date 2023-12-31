//
//  ScoreDetail.swift
//  Score++ Watch App
//
//  Created by Alvin Tsang on 2023-12-28.
//

import SwiftUI

struct ScoreView: View {
    @Binding var playerScore: Int
    @Binding var scores: Score
    @Binding var match: Match
    var selectedSport: Sport
    
    fileprivate func checkMatch(of sport: Sport) {
        let winner = scores.checkScore(from: sport)
        if winner == 1 {
            match.y += 1
            scores = Score.new()
        } else if winner == 2 {
            match.o += 1
            scores = Score.new()
        }
    }
    
    var body: some View {
        let longPress = LongPressGesture()
            .onEnded({ _ in
                playerScore = 0
            })
        
        let doubleTap = TapGesture(count: 2)
            .onEnded({ _ in
                playerScore = max(0, playerScore - 1)
            })
        
        let tap = TapGesture()
            .onEnded({ _ in
                playerScore += 1
                checkMatch(of: selectedSport)
                match.winner = match.checkWinner(winningMatch: selectedSport.winningMatch)
            })
        
        Text("\(playerScore)")
            .font(.largeTitle)
            .foregroundStyle(
                LinearGradient(
                    colors: [.blue, .yellow],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .padding()
            .simultaneousGesture(longPress)
            .simultaneousGesture(ExclusiveGesture(doubleTap, tap))
    }
}

#Preview {
    Group {
        let sports = SportData().sports
        ScoreView(playerScore: .constant(1), scores: .constant(Score.new()), match: .constant(Match.new()),  selectedSport: sports[0])
        ScoreView(playerScore: .constant(2), scores: .constant(Score.new()), match: .constant(Match.new()),  selectedSport: sports[0])
    }
}
