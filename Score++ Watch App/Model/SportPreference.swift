//
//  Favorite.swift
//  Score++ Watch App
//
//  Created by Alvin Tsang on 2023-12-31.
//

import Foundation

struct SportPreference: Codable {
    let id: Int
    var isFavorite: Bool
    var backgroundColor: [String]
}
