//
//  multilineGridApp.swift
//  multilineGrid
//
//  Created by Kaiman Mehmet on 03/01/2023.
//

import SwiftUI

@main
struct multilineGridApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                GridDummy1()
                    .tabItem {
                        Label("Grid Dummy 1", systemImage: "table")
                    }
                GridDummy2()
                    .tabItem {
                        Label("Grid Dummy 2", systemImage: "table.fill")
                    }
            }

        }
    }
}
