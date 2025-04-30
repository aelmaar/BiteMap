//
//  RestaurantViewModel.swift
//  BiteMap
//
//  Created by Anouar El Maaroufi on 26/4/2025.
//

import Foundation
import SwiftUI
import GooglePlacesSwift
import CoreLocation

@MainActor
@Observable
class RestaurantViewModel {
    var restaurants: [Restaurant] = []
    var restaurantImages: [UUID: UIImage] = [:]
    var searchText: String = ""
    var showLocationDeniedSheet = false
    private let restaurantService = RestaurantService.shared
    var locationService = LocationService()

    var isLoading: Bool = false

    var filteredRestaurants: [Restaurant] {
        let restaurants = restaurants
        return searchText.isEmpty ? restaurants : restaurants.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
    }

    func fetchNearbyRestaurants () async {
        guard let location = locationService.currentLocation else {
            print("Waiting for location...")
            return
        }

        isLoading = true // Show the shimmer skeleton placeholder UI

        // fetch nearby restaurant places
        if let places = try? await restaurantService.fetchNearbyRestaurantPlaces(latitude: location.latitude, longitude: location.longitude) {
            restaurants = places.map { place in

                let restaurant =  Restaurant(
                    name: place.displayName!,
                    rating: place.rating,
                    distance: locationService.calculateDistance(with: place.location),
                    formattedAddress: place.formattedAddress,
                    coordinate: place.location
                )

                return restaurant
            }

            // Load photos and get the first one for each restaurant place if it exists
            for (index, place) in places.enumerated() {
                await fetchImage(for: place, with: restaurants[index].id)
            }
        }

        isLoading = false // Hide the shimmer skeleton placeholder
    }

    func fetchImage(for restaurant: Place, with restaurantID: UUID) async {
        do {
            if let image = try await restaurantService.loadFirstPhoto(place: restaurant) {
                restaurantImages[restaurantID] = image
            }
        } catch {
            print("Failed to load image: \(error)")
        }
    }

    func checkLocationAuthorization() {
        let status = locationService.authorizationStatus
        if status == .denied || status == .restricted {
            showLocationDeniedSheet = true
        } else {
            showLocationDeniedSheet = false
        }
    }
}
