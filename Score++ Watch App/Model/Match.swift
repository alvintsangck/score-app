//
//  Match.swift
//  Score++ Watch App
//
//  Created by Alvin Tsang on 2023-12-31.
//

import Foundation

struct Match {
    var y: Int
    var o: Int
    var winner: String

    static func new() -> Match {
        return Match(y: 0, o: 0, winner: "")
    }
    
    func checkWinner(winningMatch: Int) -> String {
        if y == winningMatch {
            return "You"
        } else if o == winningMatch {
            return "Opponent"
        } else {
            return ""
        }
    }
}
