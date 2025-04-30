//
//  LaunchView.swift
//  BiteMap
//
//  Created by Anouar El Maaroufi on 23/4/2025.
//

import SwiftUI

struct LaunchView: View {
    @State private var scale = 0.5

    var body: some View {
        ZStack{
            Color(.secondarySystemBackground)
                .ignoresSafeArea()
            VStack {
                Image("AppLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .clipShape(.rect(cornerRadius: 20))
                Text("BiteMap")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundStyle(.primary)
            }
            .scaleEffect(scale)
            .shadow(radius: 2)
            .onAppear {
                withAnimation(.easeInOut(duration: 1.0)) {
                    scale = 1.0
                }
            }
        }
    }
}

#Preview {
    LaunchView()
}
