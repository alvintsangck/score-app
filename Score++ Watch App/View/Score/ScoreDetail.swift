//
//  ScoreDetail.swift
//  Score++ Watch App
//
//  Created by Alvin Tsang on 2023-12-28.
//

import SwiftUI

struct ScoreDetail: View {
    @Binding var score: Int
    var isSelected: Bool
    var onTapped: ()-> Void
    
    var body: some View {
        Text("\(score, specifier: "%d")")
            .font(.largeTitle)
            .foregroundStyle(isSelected ? .teal : .primary)
            .padding()
            .onTapGesture {
                onTapped()
            }
        //                            .focusable()
        //                            .digitalCrownRotation($scores.y,
        //                                                  from: 0.0,
        //                                                  through: 200.0,
        //                                                  by: 1.0)
    }
}

#Preview {
    Group {
        ScoreDetail(score: .constant(1), isSelected: true) {
        }
        ScoreDetail(score: .constant(2), isSelected: false) {
        }
    }
}
