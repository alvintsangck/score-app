//
//  SportData.swift
//  Score++ Watch App
//
//  Created by Alvin Tsang on 2023-12-27.
//

import Foundation

@Observable
class SportData {
    var sports = load("sportData.json", key: "preference")
}
