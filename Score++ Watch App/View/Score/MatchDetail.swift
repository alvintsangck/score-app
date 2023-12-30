//
//  MatchDetail.swift
//  Score++ Watch App
//
//  Created by Alvin Tsang on 2023-12-30.
//

import SwiftUI

struct MatchDetail: View {
    let match: Score
    var selectedSport: Sport
    let matchWinner: String
    
    var body: some View {
        if matchWinner.isEmpty {
            HStack {
                Text("\(match.y)")
                    .font(.title)
                Text(selectedSport.icon)
                    .font(.title)
                Text("\(match.o)")
                    .font(.title)
            }
        }
    }
}

#Preview {
    MatchDetail(match: Score(y: 1, o: 0), selectedSport: SportData().sports[0], matchWinner: "")
}
