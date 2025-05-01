//
//  Color-Theme.swift
//  BiteMap
//
//  Created by Anouar El Maaroufi on 23/4/2025.
//

import SwiftUI

extension Color {
    init(hex: String) {
        // convert hex code into rgb
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let r, g, b: UInt64
        (r, g, b) = (int >> 16, int >> 8 & 0xFF, int & 0xFF)
        self.init(red: Double(r) / 255, green: Double(g) / 255, blue: Double(b) / 255)
    }
}
