//
//  WelcomeView.swift
//  BiteMap
//
//  Created by Anouar El Maaroufi on 23/4/2025.
//

import SwiftUI

struct WelcomeView: View {
    var onGetStarted: () -> Void
    
    var body: some View {
        VStack {
            VStack(spacing: 16) {
                Image("welcome")
                    .resizable()
                    .scaledToFit()

                Text("BiteMap")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundStyle(.primary)

                Text("Your perfect meal is nearby. Let’s find it!")
                    .font(.system(size: 18, weight: .medium))
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
            }
            
            Spacer()

            Button(action: onGetStarted)  {
                // Move to Home Page
                Text("Get Started")
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
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
            }
        }
        .padding(.horizontal, 24)
        .padding(.vertical)
        .background(Color(.secondarySystemBackground))
    }
}

#Preview {
    WelcomeView() { }
}
