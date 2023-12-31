//
//  SportViewGesture.swift
//  Score++ Watch App
//
//  Created by Alvin Tsang on 2023-12-31.
//

import SwiftUI

struct SportViewGesture: View {
    @Binding var playerScore: Int
    @Binding var match: Match
    let sport: Sport
    
    fileprivate func checkMatch(of sport: Sport) {
        let winner = match.currentMatch.checkScore(from: sport)
        if winner == Team.One {
            match.scores.teamOneScore += 1
            match.currentMatch = Scores.new()
        } else if winner == Team.Two {
            match.scores.teamTwoScore += 1
            match.currentMatch = Scores.new()
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
                checkMatch(of: sport)
                match.winner = match.checkWinner(winningMatch: sport.winningMatch)
            })
        
            Color.clear
            .contentShape(Rectangle())
            .simultaneousGesture(longPress)
            .simultaneousGesture(ExclusiveGesture(doubleTap, tap))
            .edgesIgnoringSafeArea(.all)
    }
}
