//
//  SportData.swift
//  Score++ Watch App
//
//  Created by Alvin Tsang on 2023-12-27.
//

import Foundation

@Observable
class SportData {
    var sports: [any Sport] = [
        Badminton(id: 1, name: "Badminton", icon: "🏸", isFavorite: true, scoreGapNeeded: 2, winningMatch: 2, winningScore: 21),
        PingPong(id: 2, name: "Ping Pong", icon: "🏓", isFavorite: false, scoreGapNeeded: 2, winningMatch: 3, winningScore: 11),
        TestSport(id: 3, name: "Football", icon: "⚽️", isFavorite: false, scoreGapNeeded: 0, winningMatch: -1, winningScore: -1),
        TestSport(id: 4, name: "Basketball", icon: "🏀", isFavorite: false, scoreGapNeeded: 0, winningMatch: -1, winningScore: -1)
    ]
}
