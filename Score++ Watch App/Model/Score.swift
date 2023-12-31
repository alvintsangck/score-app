//
//  Score.swift
//  Score++ Watch App
//
//  Created by Alvin Tsang on 2023-12-28.
//

import Foundation

struct Score {
    var y: Int
    var o: Int
    
    static func new() -> Score {
        return Score(y: 0, o: 0)
    }
    
    func checkScore(from sport: Sport) -> Int {
        switch sport.type {
        case .badminton: checkBadmintonScore(scores: self, winningScore: sport.winningScore, scoreGapNeeded: sport.scoreGapNeeded)
        case .pingpong: checkPingPongScore(scores: self, winningScore: sport.winningScore, scoreGapNeeded: sport.scoreGapNeeded)
        case .football: 0
        case .basketball: 0
        }
    }
    
    private func checkBadmintonScore(scores: Score, winningScore: Int, scoreGapNeeded: Int) -> Int {
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
    
    private func checkPingPongScore(scores: Score, winningScore: Int, scoreGapNeeded: Int) -> Int {
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
