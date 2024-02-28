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
    var backgroundColor: [String]
    let scoreGapNeeded: Int
    let type: SportType
    let winningMatch: Int
    let winningScore: Int
    
    enum SportType: String, Codable {
        case badminton
        case pingpong
        case football
        case basketball
    }
}
