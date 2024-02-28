//
//  SportDetail.swift
//  Score++ Watch App
//
//  Created by Alvin Tsang on 2023-12-27.
//

import SwiftUI

struct SportView: View {
    @Environment(SportData.self) var sportData
    @State private var match = Match.new()
    @State private var isSettingOn = false
    var sport: Sport
    

    var body: some View {
        @Bindable var sportData = sportData
        var sportIndex: Int {
            sportData.sports.firstIndex(where: { $0.id == sport.id })!
        }
        
        NavigationStack {
            VStack {
                if !match.winner.isEmpty {
                    Text("\(sport.icon)\(match.winner) Win!")
                } else {
                    ZStack {
                        MatchView(match: $match, sport: sport)
                        
                        HStack {
                            SportViewGesture(playerScore: $match.currentMatch.teamOneScore, match: $match, sport: sport)
                            SportViewGesture(playerScore: $match.currentMatch.teamTwoScore, match: $match, sport: sport)
                        }
                        .containerBackground(
                            LinearGradient(colors: sportData.sports[sportIndex].backgroundColor.compactMap{Color(hex: $0)}, startPoint: .leading, endPoint: .trailing)
                                .opacity(0.4),
                            for: .navigation)
                    }
                }
            }
            .toolbar {
                SportToolBar(match: $match, isSettingOn: $isSettingOn, selectedSport: sport)
            }
        }
    }
}

#Preview {
    let sportData = SportData()
    return SportView(sport: sportData.sports[0])
        .environment(sportData)
}

#Preview {
    let sportData = SportData()
    return SportView(sport: sportData.sports[1])
        .environment(sportData)
}
