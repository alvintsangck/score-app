//
//  PingPong.swift
//  Score++ Watch App
//
//  Created by Alvin Tsang on 2023-12-28.
//

import Foundation

struct PingPong: Sport {
    var id: Int
    var name: String
    var icon: String
    var isFavorite: Bool
    var scoreGapNeeded: Int
    var winningMatch: Int
    var winningScore: Int
    
    func checkScore(scores: Score) -> Int {
        let y = scores.y
        let o = scores.o
        
        // Check if any player has reached the winning score and has the necessary gap
        if y >= winningScore || o >= winningScore {
            if abs(y - o) >= scoreGapNeeded {
                return y > o ? 1 : 2
            }
        }
        // No winner yet
        return 0
    }
}
