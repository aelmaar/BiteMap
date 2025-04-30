//
//  LocationDeniedView.swift
//  BiteMap
//
//  Created by Anouar El Maaroufi on 28/4/2025.
//

import SwiftUI

struct LocationDeniedView: View {
    
    var body: some View {
        VStack(spacing: 24) {
            Image(systemName: "location.slash")
                .font(.system(size: 50))
                .foregroundColor(.accentColor)
                .padding(.top, 20)

            Text("Location Access Needed")
                .font(.title2)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)

            Text("Please enable location access in Settings to find nearby restaurants.")
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 32)

            Button(action: {
                openAppSettings()
            }) {
                Text("Open Settings")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(
                        LinearGradient(
                            colors: [
                                Color(hex: "FF6100"),
                                Color(hex: "FF6100").opacity(0.9)
                            ],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .foregroundStyle(.white)
                    .font(.system(size: 20, weight: .semibold))
                    .clipShape(.rect(cornerRadius: 15))
                    .padding(.horizontal, 40)
            }

            Spacer()
        }
        .padding()
        .background(Color(.systemBackground))
    }

    private func openAppSettings() {
        if let url = URL(string: UIApplication.openSettingsURLString) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            }
        }
    }
}

#Preview {
    LocationDeniedView()
}
