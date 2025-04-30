//
//  ContentView.swift
//  BiteMap
//
//  Created by Anouar El Maaroufi on 20/4/2025.
//

import SwiftUI
import GooglePlaces
import GooglePlacesSwift

//struct Restaurant: Identifiable {
//    let id = UUID()
//    let name: String
//    let cuisine: String
//    let rating: Double
//    let distance: Double // in miles/km
//    let imageName: String
//    let deliveryTime: String
//}
//
//struct RestaurantListView: View {
//    @State private var searchText = ""
//    let restaurants = [
//        Restaurant(name: "Taco Fiesta", cuisine: "Mexican", rating: 4.7, distance: 0.3, imageName: "taco", deliveryTime: "15-25 min"),
//        Restaurant(name: "Sushi Palace", cuisine: "Japanese", rating: 4.9, distance: 1.2, imageName: "sushi", deliveryTime: "20-30 min"),
//        Restaurant(name: "Burger Hub", cuisine: "American", rating: 4.5, distance: 0.8, imageName: "burger", deliveryTime: "10-20 min"),
//        Restaurant(name: "Sushi Palace", cuisine: "Japanese", rating: 4.9, distance: 1.2, imageName: "sushi", deliveryTime: "20-30 min"),
//        Restaurant(name: "Sushi Palace", cuisine: "Japanese", rating: 4.9, distance: 1.2, imageName: "sushi", deliveryTime: "20-30 min"),
//        Restaurant(name: "Sushi Palace", cuisine: "Japanese", rating: 4.9, distance: 1.2, imageName: "sushi", deliveryTime: "20-30 min"),
//        Restaurant(name: "Sushi Palace", cuisine: "Japanese", rating: 4.9, distance: 1.2, imageName: "sushi", deliveryTime: "20-30 min"),
//        Restaurant(name: "Sushi Palace", cuisine: "Japanese", rating: 4.9, distance: 1.2, imageName: "sushi", deliveryTime: "20-30 min"),
//    ]
//    
//    var filteredRestaurants: [Restaurant] {
//        searchText.isEmpty ? restaurants : restaurants.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
//    }
//
//    var body: some View {
//        NavigationStack {
//            ScrollView {
//                // Search Bar
//                HStack(spacing: 12) {
//                    Image(systemName: "magnifyingglass")
//                        .foregroundColor(.gray)
//                    TextField("Search for restaurants...", text: $searchText)
//                        .foregroundColor(.primary)
//                }
//                .padding(.horizontal, 16)
//                .padding(.vertical, 12)
//                .background(Color(.systemGray6))
//                .clipShape(.rect(cornerRadius: 12))
//                .padding(.horizontal)
//                .padding(.top, 8)
//
//                // Restaurant List
//                LazyVStack(spacing: 16) {
//                    ForEach(filteredRestaurants) { restaurant in
//                        RestaurantCard(restaurant: restaurant)
//                            .padding(.horizontal)
//                    }
//                }
//                .padding(.top, 16)
//            }
//            .navigationTitle("Nearby Restaurants")
//            .scrollDismissesKeyboard(.interactively)
//        }
//    }
//}
//
////struct RestaurantCard: View {
////    let restaurant: Restaurant
////    
////    var body: some View {
////        HStack(alignment: .top, spacing: 16) {
////            // Restaurant Image
////            Image(restaurant.imageName)
////                .resizable()
////                .scaledToFill()
////                .frame(width: 100, height: 100)
////                .clipShape(RoundedRectangle(cornerRadius: 12))
////                .overlay(
////                    RoundedRectangle(cornerRadius: 12)
////                        .stroke(Color(.systemGray4), lineWidth: 1)
////                )
////
////            // Restaurant Details
////            VStack(alignment: .leading, spacing: 6) {
////                // Name & Cuisine
////                HStack(alignment: .firstTextBaseline) {
////                    Text(restaurant.name)
////                        .font(.headline)
////                    Spacer()
////                    Text("\(restaurant.distance, specifier: "%.1f") mi")
////                        .font(.subheadline)
////                        .foregroundColor(.gray)
////                }
////                
////                Text(restaurant.cuisine)
////                    .font(.subheadline)
////                    .foregroundColor(.gray)
////                
////                // Rating & Delivery Time
////                HStack(spacing: 12) {
////                    HStack(spacing: 4) {
////                        Image(systemName: "star.fill")
////                            .foregroundColor(.orange)
////                            .font(.caption)
////                        Text("\(restaurant.rating, specifier: "%.1f")")
////                            .font(.subheadline)
////                    }
////                    
////                    HStack(spacing: 4) {
////                        Image(systemName: "clock")
////                            .foregroundColor(.blue)
////                            .font(.caption)
////                        Text(restaurant.deliveryTime)
////                            .font(.subheadline)
////                    }
////                }
////                .padding(.top, 4)
////            }
////        }
////        .padding()
////        .background(Color(.systemBackground))
////        .cornerRadius(16)
////        .shadow(color: Color.black.opacity(0.05), radius: 8, x: 0, y: 4)
////    }
////}
//
//struct RestaurantCard: View {
//    let restaurant: Restaurant
//
//    var body: some View {
//        HStack(alignment: .top, spacing: 16) {
//            // Restaurant image
//            Image("")
//                .resizable()
//                .scaledToFill()
//                .frame(width: 100, height: 100)
//                .overlay(
//                    RoundedRectangle(cornerRadius: 16)
//                        .stroke(Color(.systemGray4), lineWidth: 1)
//                )
//            // Restaurant details
//            VStack(alignment: .leading, spacing: 6) {
//                // Restaurant name and distance
//                HStack {
//                    Text("Taco Fiesta")
//                        .font(.headline)
//                    Spacer()
//                    Text("0.6 mi")
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
//                        Text("4.5")
//                            .font(.subheadline)
//                    }
//
//                    HStack(spacing: 4) {
//                        Image(systemName: "clock")
//                            .foregroundStyle(.blue)
//                            .font(.caption)
//                        Text("20-30 min")
//                            .font(.subheadline)
//                    }
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


//struct ContentView: View {
//    @State private var placeImage: UIImage? = nil
//    @State private var isLoading: Bool = true
//    @State private var errorMessage: String? = nil
//
//    private let placeID = "ChIJV4k8_9UodTERU5KXbkYpSYs"
//    private let placesClient = PlacesClient.shared
//
//    var body: some View {
//        VStack {
//            if let image = placeImage {
//                Image(uiImage: image)
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 300, height: 300)
//                    .cornerRadius(10)
//            } else if isLoading {
//                ProgressView("Loading...")
//            } else if let errorMessage = errorMessage {
//                Text("Error: \(errorMessage)")
//                    .foregroundColor(.red)
//            } else {
//                Text("No photo available.")
//            }
//        }
//        .padding()
//        .onAppear {
//            Task {
//                await fetchNearbyPlaces()
//            }
//        }
//    }
//
//    func fetchNearbyPlaces() async {
//        let restriction = CircularCoordinateRegion(center: CLLocationCoordinate2DMake(35.6513912, -5.3060468), radius: 500)
//
//        let searchNearbyRequest = SearchNearbyRequest(
//            locationRestriction: restriction,
//            placeProperties: [.displayName, .photos, .types],
//            includedTypes: [.restaurant]
//        )
//
//        do {
//            switch await placesClient.searchNearby(with: searchNearbyRequest) {
//            case .success(let places):
//                print(places)
//            case .failure(let placesError):
//                throw placesError
//            }
//        } catch {
//            DispatchQueue.main.async {
//                self.errorMessage = error.localizedDescription
//            }
//        }
//    }
//
//    func loadFirstPhoto() async {
//        do {
//            // Step 1: Fetch place details
//            let fetchPlaceRequest = FetchPlaceRequest(
//                placeID: placeID,
//                placeProperties: [.photos] // Important: include .photos
//            )
//
//            let result = await placesClient.fetchPlace(with: fetchPlaceRequest)
//            let fetchedPlace: Place
//
//            switch result {
//            case .success(let place):
//                fetchedPlace = place
//            case .failure(let placesError):
//                throw placesError
//            }
//
//            // Step 2: Get the first photo
//            guard let photo = fetchedPlace.photos?.first else {
//                self.errorMessage = "No photos available for this place."
//                self.isLoading = false
//                return
//            }
//
//            // Step 3: Fetch the photo image
//            let fetchPhotoRequest = FetchPhotoRequest(
//                photo: photo,
//                maxSize: CGSize(width: 800, height: 800)
//            )
//
//            let photoResult = await placesClient.fetchPhoto(with: fetchPhotoRequest)
//
//            switch photoResult {
//            case .success(let uiImage):
//                DispatchQueue.main.async {
//                    self.placeImage = uiImage
//                    self.isLoading = false
//                }
//            case .failure(let photoError):
//                throw photoError
//            }
//
//        } catch {
//            DispatchQueue.main.async {
//                self.errorMessage = error.localizedDescription
//                self.isLoading = false
//            }
//            print("❌ Error loading photo: \(error.localizedDescription)")
//        }
//    }
//}

#Preview {
    ContentView()
}
