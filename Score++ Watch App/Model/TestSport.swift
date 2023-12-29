//
//  TestSport.swift
//  Score++ Watch App
//
//  Created by Alvin Tsang on 2023-12-29.
//

import Foundation

struct TestSport: Sport {
    var id: Int
    var name: String
    var icon: String
    var isFavorite: Bool
    var scoreGapNeeded: Int
    var winningMatch: Int
    var winningScore: Int
    
    func checkScore(scores: Score) -> Int {
        return 0
    }
}
