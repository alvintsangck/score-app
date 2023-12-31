//
//  MatchDetail.swift
//  Score++ Watch App
//
//  Created by Alvin Tsang on 2023-12-30.
//

import SwiftUI

struct MatchView: View {
    let match: Match
    var selectedSport: Sport
    
    var body: some View {
        if match.winner.isEmpty {
            HStack {
                Text("\(match.y)")
                    .font(.title)
                Text(selectedSport.icon)
                    .font(.title)
                Text("\(match.o)")
                    .font(.title)
            }
        } else {
            EmptyView()
        }
    }
}

#Preview {
    MatchView(match: Match(y: 1, o: 0,winner: ""), selectedSport: SportData().sports[0])
}
