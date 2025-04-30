//
//  RestaurantService.swift
//  BiteMap
//
//  Created by Anouar El Maaroufi on 26/4/2025.
//

import Foundation
import GooglePlacesSwift
import CoreLocation
import SwiftUI

@MainActor
class RestaurantService {

    static let shared = RestaurantService()
    private let placesClient = PlacesClient.shared

    private init() {}

    func fetchNearbyRestaurantPlaces(latitude: Double, longitude: Double) async throws -> [Place] {
        // Choose 3 KM radius to find neaarby restaurants
        let restriction = CircularCoordinateRegion(center: CLLocationCoordinate2DMake(latitude, longitude), radius: 3000)

        let searchNearbyRequest = SearchNearbyRequest(
            locationRestriction: restriction,
            placeProperties: [
                .displayName,
                .photos,
                .types,
                .rating,
                .formattedAddress,
                .coordinate,
            ],
            includedTypes: [.restaurant]
        )

        switch await placesClient.searchNearby(with: searchNearbyRequest) {
            case .success(let places):
                return places
            case .failure(let placesError):
                throw placesError
        }
    }

    func loadFirstPhoto(place: Place) async throws -> UIImage? {
        // Get the first photo
        guard let photo = place.photos?.first else {
            return nil
        }

        // Fetch the photo image
        let fetchPhotoRequest = FetchPhotoRequest(
            photo: photo,
            maxSize: CGSize(width: 800, height: 800)
        )

        let photoResult = await placesClient.fetchPhoto(with: fetchPhotoRequest)

        switch photoResult {
            case .success(let uiImage):
                return uiImage
            case .failure(let photoError):
                throw photoError
        }
    }
}
