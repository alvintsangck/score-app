//
//  ScoreDetail.swift
//  Score++ Watch App
//
//  Created by Alvin Tsang on 2023-12-28.
//

import SwiftUI

struct ScoreView: View {
    let scores: Scores
    
    var body: some View {
        HStack {
            Text("\(scores.teamOneScore)")
                .font(.largeTitle)
                .padding()
            Text(":")
                .font(.largeTitle)
                .baselineOffset(6)
            Text("\(scores.teamTwoScore)")
                .font(.largeTitle)
                .padding()
        }
    }
}

#Preview {
    ScoreView(scores: Scores(teamOneScore: 1, teamTwoScore: 0))
}
