//
//  LocationService.swift
//  BiteMap
//
//  Created by Anouar El Maaroufi on 26/4/2025.
//

import Foundation
import CoreLocation

extension CLLocationCoordinate2D: @retroactive Equatable {
    public static func == (lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
        lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
    }
}

@Observable
class LocationService: NSObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    var currentLocation: CLLocationCoordinate2D?
    var authorizationStatus: CLAuthorizationStatus?

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }

    func requestLocationAccess() {
        locationManager.requestWhenInUseAuthorization()
    }

    func startUpdatingLocation() {
        locationManager.startUpdatingLocation()
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        authorizationStatus = manager.authorizationStatus

        switch authorizationStatus {
            case .authorizedAlways, .authorizedWhenInUse:
                startUpdatingLocation()
            default:
                break
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // Update current user location on every 100 meters
        guard let newCoordinate = locations.last?.coordinate else { return }

        if let oldLocation = currentLocation {
            let moveDistance = CLLocation(latitude: oldLocation.latitude, longitude: oldLocation.longitude).distance(from: CLLocation(latitude: newCoordinate.latitude, longitude: newCoordinate.longitude))
            
            if moveDistance < 100 {
                return
            }
        }

        currentLocation = newCoordinate
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print("Failed to get user location: \(error.localizedDescription)")
    }

    func stopLoading() {
        locationManager.stopUpdatingLocation()
    }

    func calculateDistance(with destination: CLLocationCoordinate2D) -> Double {
        let userLocation = CLLocation(latitude: (currentLocation?.latitude)!, longitude: (currentLocation?.longitude)!)
        
        let destinationLocation = CLLocation(latitude: destination.latitude, longitude: destination.longitude)

        return userLocation.distance(from: destinationLocation)
    }
}
