//
//  Match.swift
//  Score++ Watch App
//
//  Created by Alvin Tsang on 2023-12-31.
//

import Foundation

struct Match {
    var scores: Scores
    var currentMatch: Scores
    var winner: String

    static func new() -> Match {
        return Match(scores: Scores.new(), currentMatch: Scores.new(), winner: "")
    }
    
    func checkWinner(winningMatch: Int) -> String {
        if scores.teamOneScore == winningMatch {
            return "You"
        } else if scores.teamTwoScore == winningMatch {
            return "Opponent"
        } else {
            return ""
        }
    }
}
