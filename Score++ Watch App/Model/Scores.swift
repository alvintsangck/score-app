//
//  Score.swift
//  Score++ Watch App
//
//  Created by Alvin Tsang on 2023-12-28.
//

import Foundation

struct Scores {
    var teamOneScore: Int
    var teamTwoScore: Int
    
    static func new() -> Scores {
        return Scores(teamOneScore: 0, teamTwoScore: 0)
    }
    
    func checkScore(from sport: Sport) -> Team {
        switch sport.type {
        case .badminton: checkBadmintonScore(scores: self, winningScore: sport.winningScore, scoreGapNeeded: sport.scoreGapNeeded)
        case .pingpong: checkPingPongScore(scores: self, winningScore: sport.winningScore, scoreGapNeeded: sport.scoreGapNeeded)
        case .football: Team.None
        case .basketball: Team.None
        }
    }
    
    private func checkBadmintonScore(scores: Scores, winningScore: Int, scoreGapNeeded: Int) -> Team {
        let y = scores.teamOneScore
        let o = scores.teamTwoScore
        // max score is 30
        if y == 30 {
            return Team.One
        } else if o == 30 {
            return Team.Two
        }
        
        // Check if any player has reached the winning score and has the necessary gap
        else if y >= winningScore || o >= winningScore {
            if abs(y - o) >= scoreGapNeeded {
                return y > o ? Team.One : Team.Two
            }
        }
        // No winner yet
        return Team.None
    }
    
    private func checkPingPongScore(scores: Scores, winningScore: Int, scoreGapNeeded: Int) -> Team {
        let y = scores.teamOneScore
        let o = scores.teamTwoScore
        
        // Check if any player has reached the winning score and has the necessary gap
        if y >= winningScore || o >= winningScore {
            if abs(y - o) >= scoreGapNeeded {
                return y > o ? Team.One : Team.Two
            }
        }
        // No winner yet
        return Team.None
    }
    
}
