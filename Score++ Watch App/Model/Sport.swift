//
//  Sport.swift
//  Score++ Watch App
//
//  Created by Alvin Tsang on 2023-12-27.
//

import Foundation

struct Sport: Identifiable, Hashable, Codable {
    let id: Int
    let name: String
    let icon: String
    var isFavorite: Bool
    let scoreGapNeeded: Int
    let type: SportType
    let winningMatch: Int
    let winningScore: Int
    
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
