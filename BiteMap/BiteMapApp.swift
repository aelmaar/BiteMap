//
//  BiteMapApp.swift
//  BiteMap
//
//  Created by Anouar El Maaroufi on 20/4/2025.
//

import SwiftUI
import GooglePlaces

@main
struct BiteMapApp: App {
    init() {
        GMSPlacesClient.provideAPIKey("AIzaSyDXV4mS19r9_Y3AeSzt_KU2qVwUN5DJxXY")
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
