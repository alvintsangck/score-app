//
//  Badminton.swift
//  Score++ Watch App
//
//  Created by Alvin Tsang on 2023-12-28.
//

import Foundation

struct Badminton: Sport {
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
        // max score is 30
        if y == 30 {
            return 1
        } else if o == 30 {
            return 2
        }
        
        // Check if any player has reached the winning score and has the necessary gap
        else if y >= winningScore || o >= winningScore {
            if abs(y - o) >= scoreGapNeeded {
                return y > o ? 1 : 2
            }
        }
        // No winner yet
        return 0
    }
}
