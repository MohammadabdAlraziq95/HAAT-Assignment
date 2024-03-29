//
//  LocationManager.swift
//  HAAT-Assignment
//
//  Created by Mo Raziq on 7/12/22.
//

import Foundation
import MapKit

protocol LocationManagerDelegate: AnyObject {
    func didUpdateLocation(_ location: CLLocation?)
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus)
}

class LocationManager: NSObject {
    weak var delegate: LocationManagerDelegate?
    static let shared = LocationManager()
    private var locManager = CLLocationManager()
    var currentLocation: CLLocation?
    
    override init() {
        super.init()
        locManager.allowsBackgroundLocationUpdates = true
        locManager.distanceFilter = 2
        locManager.pausesLocationUpdatesAutomatically = false
        locManager.delegate = self
    }
    
    func requestLocation() {
        if #available(iOS 14.0, *) {
            if locManager.authorizationStatus == .notDetermined {
                locManager.requestAlwaysAuthorization()
                locManager.startUpdatingLocation()
            } else if locManager.authorizationStatus == .denied {
                //
            } else {
                locManager.startUpdatingLocation()
            }
        } else {
            // Fallback on earlier versions
            if CLLocationManager.authorizationStatus() == .notDetermined {
                locManager.requestAlwaysAuthorization()
                locManager.startUpdatingLocation()
                
            } else if CLLocationManager.authorizationStatus() == .denied {
                //
            } else {
                locManager.startUpdatingLocation()
            }
        }
    }
    
    func stopUpdatingLocation() {
        locManager.stopUpdatingLocation()
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways || status == .authorizedWhenInUse {
            manager.startUpdatingLocation()
        } else if status == .restricted {
        } else {
            currentLocation = nil
        }
        delegate?.locationManager(manager, didChangeAuthorization: status)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        currentLocation = locations.first
        self.delegate?.didUpdateLocation(locations.first)
        print("Did update new location \(currentLocation!.coordinate)")
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("LocationManager fail with error \(error.localizedDescription)")
    }
}
