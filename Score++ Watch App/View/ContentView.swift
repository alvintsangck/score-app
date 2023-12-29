//
//  ContentView.swift
//  Score++ Watch App
//
//  Created by Alvin Tsang on 2023-12-27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        SportList()
    }
}

#Preview {
    ContentView()
        .environment(SportData())
}
