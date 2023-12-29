//
//  SportRow.swift
//  Score++ Watch App
//
//  Created by Alvin Tsang on 2023-12-27.
//

import SwiftUI

struct SportRow: View {
    var sport: Sport
    
    var body: some View {
        HStack {
            Text(sport.icon)
            Text(sport.name.capitalized)
            
            Spacer()
            
            if sport.isFavorite {
                Image(systemName: "star.fill").foregroundStyle(.yellow)
            }
        }
    }
}

#Preview {
    let sports = SportData().sports
    return Group{
        SportRow(sport: sports[0])
            .padding()
        SportRow(sport: sports[1])
            .padding()
    }
}
