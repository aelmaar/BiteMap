//
//  RestaurantListView.swift
//  BiteMap
//
//  Created by Anouar El Maaroufi on 26/4/2025.
//

import SwiftUI
import CoreLocation

@Observable
class DetailScreenManager {
    var selectedRestaurant: Restaurant?
    var selectedImage: UIImage?
    var showDetailSheet = false
}

struct RestaurantListView: View {
    @State private var viewModel = RestaurantViewModel()
    @State private var detailScreenManager = DetailScreenManager()

    var body: some View {
        NavigationStack {
            ScrollView {
                // Search Bar
                HStack(spacing: 12) {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    TextField("Search for restaurants...", text: $viewModel.searchText)
                        .foregroundColor(.primary)
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 12)
                .background(Color(.systemGray6))
                .clipShape(.rect(cornerRadius: 12))
                .padding(.horizontal)
                .padding(.top, 8)

                // If not loading and no restaurants
                if !viewModel.isLoading && viewModel.filteredRestaurants.isEmpty {
                    VStack(spacing: 8) {
                        Image(systemName: "fork.knife.circle")
                            .font(.largeTitle)
                            .foregroundColor(.secondary)
                        Text("No restaurants found")
                            .font(.headline)
                            .foregroundColor(.secondary)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.top, 32)
                }

                // Restaurant List
                LazyVStack(spacing: 16) {
                    // Data is loading...
                    if viewModel.isLoading {
                        ForEach(0..<4) { _ in
                            RestaurantCardSkeleton()
                        }
                    } else {
                        // Display restaurant row card for each restaurant
                        ForEach(viewModel.filteredRestaurants) { restaurant in
                            let image = viewModel.restaurantImages[restaurant.id]

                                RestaurantCard(restaurant: restaurant, image: image)
                                    .onTapGesture {
                                        detailScreenManager.selectedRestaurant = restaurant
                                        detailScreenManager.selectedImage = image
                                        detailScreenManager.showDetailSheet = true
                                    }
                        }
                    }
                }
                .padding(.top, 16)
            }
            .navigationTitle("Nearby Restaurants")
            .scrollDismissesKeyboard(.interactively)
            .onAppear {
                print("Location is been accessed")
                viewModel.locationService.requestLocationAccess()
            }
            .onChange(of: viewModel.locationService.currentLocation) {
                print("Fetching nearby restaurant")
                Task {
                    await viewModel.fetchNearbyRestaurants()
                }
            }
            .onChange(of: viewModel.locationService.authorizationStatus) {
                print("Check authorization status")
                viewModel.checkLocationAuthorization()
            }
            .sheet(isPresented: $viewModel.showLocationDeniedSheet) {
                LocationDeniedView()
                    .presentationDetents([.fraction(0.45)])
                    .presentationDragIndicator(.visible)
            }
            .fullScreenCover(isPresented: $detailScreenManager.showDetailSheet) {
                if let restaurant = detailScreenManager.selectedRestaurant {
                    RestaurantDetailView(restaurant: restaurant, image: detailScreenManager.selectedImage)
                }
            }
        }
    }
}

#Preview {
    RestaurantListView()
}
