//
//  BiteMapApp.swift
//  BiteMap
//
//  Created by Anouar El Maaroufi on 20/4/2025.
//

import SwiftUI
import GooglePlacesSwift

extension Bundle {
    var googleAPIKey: String {
        guard let key = object(forInfoDictionaryKey: "GOOGLE_API_KEY") as? String else {
            fatalError("GOOGLE_API_KEY not found in Info.plist")
        }
        return key
    }
}


@main
struct BiteMapApp: App {
    init() {
        PlacesClient.provideAPIKey(Bundle.main.googleAPIKey)
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
