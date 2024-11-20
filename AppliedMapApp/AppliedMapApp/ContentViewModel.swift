//
//  ContentViewModel.swift
//  AppliedMapApp
//
//  Created by DDUKK on 19/10/24.
//

import Foundation
import CoreLocation
import MapKit
import SwiftUI

final class ContentViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    var locationManager: CLLocationManager?
    
    
    @Published var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 43.457105, longitude: -80.508361), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    
    var binding: Binding<MKCoordinateRegion> {
        Binding {
            self.mapRegion
        } set: { newRegion in
            self.mapRegion = newRegion
        }
    }
    
    func checkIfLocationIsEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager?.desiredAccuracy = kCLLocationAccuracyBest
            locationManager?.delegate = self
            
            checkLocationAuthorization()
            
            
            
//            let region = CLCircularRegion(center: CLLocationCoordinate2D(latitude: 43.457105, longitude: -80.508361), radius: 1000, identifier: "MyLocation")
//            locationManager?.startMonitoring(for: region)
            print("Show an alert letting them know this is off")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion){
        print("Entered MY LOCATION \(region)")
    }
    
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion){
        print("Exited MY LOCATION \(region)")
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
//        let previousAuthorizationStatus = manager.authorizationStatus
//        manager.requestWhenInUseAuthorization()
//        if manager.authorizationStatus != previousAuthorizationStatus {
//            checkLocationAuthorization()
//        }
        checkLocationAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            mapRegion = MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
        }
    }
    
    
    
    
    private func checkLocationAuthorization() {
        guard let location = locationManager else {
            return
        }
        
        switch location.authorizationStatus {
        case .notDetermined:
            locationManager?.requestLocation()
            print("Location authorization is not determined.")
        case .restricted:
            print("Location is restricted.")
        case .denied:
            print("Location permission denied.")
        case .authorizedAlways, .authorizedWhenInUse:
            locationManager?.startUpdatingLocation()
            if let location = location.location {
                mapRegion = MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
            }
            
        default:
            break
        }
    }
}
