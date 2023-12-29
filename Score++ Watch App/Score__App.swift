//
//  Score__App.swift
//  Score++ Watch App
//
//  Created by Alvin Tsang on 2023-12-27.
//

import SwiftUI

@main
struct Score___Watch_AppApp: App {
    @State private var sportData = SportData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(sportData)
        }
    }
}
