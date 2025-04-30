//
//  Restaurant.swift
//  BiteMap
//
//  Created by Anouar El Maaroufi on 26/4/2025.
//

import Foundation
import CoreLocation

struct Restaurant: Identifiable {
    let id = UUID()
    let name: String
    let rating: Float?
    let distance: Double
    let formattedAddress: String?
    let coordinate: CLLocationCoordinate2D?
    
    var formattedDistance: String {
        if distance < 1000 {
            return String(format: "%.0f m", distance) // No decimals for meters
        } else {
            return String(format: "%.1f km", distance / 1000)
        }
    }

    var formattedRating: String {
        String(format: "%.1f", rating ?? 0)
    }
}
