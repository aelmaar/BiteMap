//
//  ContentView.swift
//  BiteMap
//
//  Created by Anouar El Maaroufi on 20/4/2025.
//

import SwiftUI
import GooglePlaces
import GooglePlacesSwift

enum AppState {
    case launch
    case splash
    case main
}

struct ContentView: View {
    @State private var appState: AppState = .launch
    @AppStorage("IsFirstLaunch") var isFirstLaunch: Bool = true

    var body: some View {
        switch appState {
        case .launch:
            LaunchView()
                .onAppear {
                    Task {
                        try? await Task.sleep(for: .seconds(2))
                        appState = isFirstLaunch ? .splash : .main
                    }
                }
        case .splash:
            WelcomeView {
                appState = .main
                isFirstLaunch = false
            }
        case .main:
            RestaurantListView()
        }
    }
}

#Preview {
    ContentView()
}
