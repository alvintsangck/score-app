//
//  FavoriteButton.swift
//  Score++ Watch App
//
//  Created by Alvin Tsang on 2023-12-27.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet: Bool
    var save: () -> Void
    
    var body: some View {
        Button("Toggle Favorite", systemImage: isSet ? "star.fill" : "star") {
            isSet.toggle()
            save()
        }
    }
}

#Preview {
    Group {
        FavoriteButton(isSet: .constant(true)){
        }
        FavoriteButton(isSet: .constant(false)){
        }
    }
}
