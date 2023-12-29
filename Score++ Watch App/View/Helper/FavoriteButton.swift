//
//  FavoriteButton.swift
//  Score++ Watch App
//
//  Created by Alvin Tsang on 2023-12-27.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet: Bool
    
    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            if isSet {
                Image(systemName: "star")
                    .symbolVariant(/*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(.yellow)
            } else {
                Image(systemName: "star")
            }
        }
    }
}

#Preview {
    FavoriteButton(isSet: .constant(true))
}
