//
//  SettingView.swift
//  Score++ Watch App
//
//  Created by Alvin Tsang on 2024-02-21.
//

import SwiftUI

struct SettingsView: View {
    @State private var isColorLeft: Bool = true
    @Binding var selectedColors: [String]
    let colors: [Color] = [.white, .black, .blue, .red, .green, .yellow, .orange, .pink, .purple, .gray]

    var body: some View {
        let backgroundColors = selectedColors.compactMap{Color(hex: $0)}
        VStack {
            HStack{
                Text("Background Colour")
                Button(action: {isColorLeft = true}, label: {
                    Circle()
                        .fill(backgroundColors[0])
                        .frame(width: 30)
                        .overlay(Circle().stroke(isColorLeft ? .white : .clear, lineWidth: 2))
                        .overlay(Circle().strokeBorder(isColorLeft ? .black : .clear, lineWidth: 2))
                })
                .buttonStyle(PlainButtonStyle())
                
                Button(action: {isColorLeft = false}, label: {
                    Circle()
                        .fill(backgroundColors[1])
                        .frame(width: 30)
                        .overlay(Circle().stroke(!isColorLeft ? .white : .clear, lineWidth: 2))
                        .overlay(Circle().strokeBorder(!isColorLeft ? .black : .clear, lineWidth: 2))
                })
                .buttonStyle(PlainButtonStyle())
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(colors.indices, id: \.self) { index in
                        Button(action: {
                            if (isColorLeft) {
                                selectedColors[0] = colors[index].toHexString()!
                            } else {
                                selectedColors[1] = colors[index].toHexString()!
                            }
                        }) {
                            Circle()
                                .fill(colors[index])
                                .frame(width: 40)
                            
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
            }
        }
    }
}

#Preview {
    SettingsView(selectedColors: .constant(["#000000", "#000000"]))
}
