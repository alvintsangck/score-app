//
//  Sport.swift
//  Score++ Watch App
//
//  Created by Alvin Tsang on 2023-12-27.
//

import Foundation

protocol Sport {
    var id: Int { get }
    var name: String { get }
    var icon: String { get }
    var isFavorite: Bool { get set }
    var scoreGapNeeded: Int { get }
    var winningMatch: Int { get }
    var winningScore: Int { get }
    
    func checkScore(scores: Score) -> Int
}

extension Sport {
    func checkWinner(match: Score) -> String {
        if match.y == winningMatch {
            return "You"
        } else if match.o == winningMatch {
            return "Opponent"
        } else {
            return ""
        }
    }
}
