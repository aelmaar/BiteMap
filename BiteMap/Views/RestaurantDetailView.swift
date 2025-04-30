//
//  RestaurantDetailView.swift
//  BiteMap
//
//  Created by Anouar El Maaroufi on 29/4/2025.
//

import SwiftUI
import MapKit

struct RestaurantDetailView: View {
    let restaurant: Restaurant
    let image: UIImage?
    @Environment(\.dismiss) private var dismiss

    var coordinate: CLLocationCoordinate2D {
        restaurant.coordinate ?? CLLocationCoordinate2D(latitude: 0, longitude: 0)
    }
    
    var region: MKCoordinateRegion {
        MKCoordinateRegion(center: coordinate, latitudinalMeters: 800, longitudinalMeters: 800)
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    // Map
                    Map(position: .constant(.region(region))) {
                        Marker(restaurant.name, coordinate: coordinate)
                    }
                    .frame(height: 220)
                    .cornerRadius(16)
                    .padding(.horizontal)
                    
                    // Image
                    if let image {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                            .frame(height: 180)
                            .clipped()
                            .cornerRadius(16)
                            .padding(.horizontal)
                    }
                    
                    // Name
                    Text(restaurant.name)
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    
                    // Address
                    if let address = restaurant.formattedAddress {
                        HStack(alignment: .top, spacing: 8) {
                            Image(systemName: "mappin.and.ellipse")
                                .foregroundColor(.blue)
                            Text(address)
                                .font(.body)
                                .foregroundColor(.secondary)
                        }
                        .padding(.horizontal)
                    }
                    
                    // Rating and Distance
                    HStack(spacing: 16) {
                        Label(
                            title: { Text(restaurant.formattedRating) },
                            icon: {
                                Image(systemName: "star.fill")
                                    .foregroundColor(.orange)
                            }
                        )
                        
                        Label(
                            title: { Text(restaurant.formattedDistance) },
                            icon: {
                                Image(systemName: "location")
                                    .foregroundColor(.blue)
                            }
                        )
                    }
                    .font(.subheadline)
                    .foregroundColor(.primary)
                    .padding(.horizontal)
                    
                    Spacer()
                }
                .padding(.top)
            }
            .background(Color(.systemBackground))
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle")
                            .foregroundStyle(Color.gray)
                            .font(.system(size: 24))
                    }
                }
            }
            .toolbarBackground(.hidden, for: .navigationBar)
        }
    }
}

#Preview {
    RestaurantDetailView(
        restaurant: Restaurant(
            name: "Taco Fiesta",
            rating: 4.7,
            distance: 500,
            formattedAddress: "123 Main Street, Rabat, Morocco",
            coordinate: CLLocationCoordinate2D(latitude: 35.5898261, longitude: -5.3416264)
        ),
        image: nil
    )
}
