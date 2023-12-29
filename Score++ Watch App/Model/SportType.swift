//
//  SportType.swift
//  Score++ Watch App
//
//  Created by Alvin Tsang on 2023-12-29.
//

import Foundation

enum SportType: String, Codable {
    case badminton
    case pingpong
    case football
    case basketball
}

func checkScore(from sport: Sport, scores: Score) -> Int {
    switch sport.type {
    case .badminton: checkBadmintonScore(scores: scores, winningScore: sport.winningScore, scoreGapNeeded: sport.scoreGapNeeded)
    case .pingpong: checkPingPongScore(scores: scores, winningScore: sport.winningScore, scoreGapNeeded: sport.scoreGapNeeded)
    case .football: 0
    case .basketball: 0
    }
}

func checkBadmintonScore(scores: Score, winningScore: Int, scoreGapNeeded: Int) -> Int {
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

func checkPingPongScore(scores: Score, winningScore: Int, scoreGapNeeded: Int) -> Int {
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
