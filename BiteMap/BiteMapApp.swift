//
//  BiteMapApp.swift
//  BiteMap
//
//  Created by Anouar El Maaroufi on 20/4/2025.
//

import SwiftUI
import GooglePlacesSwift

@main
struct BiteMapApp: App {
    init() {
        PlacesClient.provideAPIKey("YOUR_API_KEY_HERE")
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
