//
//  StarWars_CharactersApp.swift
//  StarWars Characters
//
//  Created by Marcus Monteiro on 18/08/24.
//

import SwiftUI

@main
struct StarWars_CharactersApp: App {
    @StateObject var networkMonitor = NetworkMonitor()
    
    var body: some Scene {
        WindowGroup {
            ListView()
                .environmentObject(networkMonitor)
        }
    }
}
