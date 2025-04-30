//
//  RestaurantCardView.swift
//  BiteMap
//
//  Created by Anouar El Maaroufi on 26/4/2025.
//

//import SwiftUI
//
//struct RestaurantCard: View {
//    let restaurant: Restaurant
//    let image: UIImage?
//
//    var body: some View {
//        HStack(alignment: .top, spacing: 16) {
//            // Restaurant image
//            Image(uiImage: (image != nil) ? image! : UIImage(systemName: "photo")!)
//                .resizable()
//                .scaledToFit()
//                .frame(width: 100, height: 100)
//                .overlay(
//                    RoundedRectangle(cornerRadius: 16)
//                        .stroke(Color(.systemGray4), lineWidth: 1)
//                )
//            // Restaurant details
//            VStack(alignment: .leading, spacing: 6) {
//                // Restaurant name and distance
//                HStack {
//                    Text(restaurant.name)
//                        .font(.headline)
//                    Spacer()
//                    Text(restaurant.formattedDistance)
//                        .font(.subheadline)
//                        .foregroundColor(.secondary)
//                }
//                // Restaurant's country
//                Text("Morocco")
//                    .font(.subheadline)
//                    .foregroundColor(.gray)
//                // Review and time to arrive
//                HStack(spacing: 12) {
//                    HStack(spacing: 4) {
//                        Image(systemName: "star.fill")
//                            .foregroundStyle(.orange)
//                            .font(.caption)
//                        Text("\(String(describing: restaurant.rating!))")
//                            .font(.subheadline)
//                    }
//
////                    HStack(spacing: 4) {
////                        Image(systemName: "clock")
////                            .foregroundStyle(.blue)
////                            .font(.caption)
////                        Text("20-30 min")
////                            .font(.subheadline)
////                    }
//                }
//            }
//        }
//        .padding()
//        .background(Color(.systemBackground))
//        .clipShape(.rect(cornerRadius: 16))
//        .shadow(color: Color.black.opacity(0.05), radius: 8, x: 0, y: 4)
//    }
//}
//
//#Preview {
//    RestaurantCard(
//        restaurant: Restaurant(name: "Taco Fiesta", description: "Taco Bar", rating: 4.7, distance: 0, formattedAddress: "In sans"), image: nil,
//    )
//}

import SwiftUI

struct RestaurantCard: View {
    let restaurant: Restaurant
    let image: UIImage?

    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            // Restaurant Image
            Image(uiImage: image ?? UIImage(systemName: "photo")!)
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 90)
                .clipped()
                .cornerRadius(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.primary.opacity(0.1), lineWidth: 0.5)
                )

            // Restaurant Details
            VStack(alignment: .leading, spacing: 8) {
                // Name
                Text(restaurant.name)
                    .font(.headline)
                    .lineLimit(1)

                // Address
                Text(restaurant.formattedAddress ?? "Unknown Address")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(2)

                // Rating and Distance
                HStack(spacing: 12) {
                    // Rating
                    HStack(spacing: 4) {
                        Image(systemName: "star.fill")
                            .foregroundStyle(.orange)
                            .font(.caption)
                        Text(restaurant.formattedRating)
                            .font(.subheadline)
                            .foregroundStyle(.primary)
                    }

                    // Distance
                    HStack(spacing: 4) {
                        Image(systemName: "mappin.and.ellipse")
                            .foregroundStyle(.blue)
                            .font(.caption)
                        Text(restaurant.formattedDistance)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(uiColor: .secondarySystemBackground))
                .shadow(color: Color.primary.opacity(0.05), radius: 10, x: 0, y: 5)
        )
        .padding(.horizontal)
    }
}

#Preview {
    RestaurantCard(
        restaurant: Restaurant(
            name: "Taco Fiesta",
            rating: 4.7,
            distance: 500,
            formattedAddress: "123 Main Street, Rabat, Morocco",
            coordinate: nil
        ),
        image: nil
    )
}
