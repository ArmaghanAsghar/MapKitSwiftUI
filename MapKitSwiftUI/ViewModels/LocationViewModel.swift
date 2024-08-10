//
//  LocationViewModel.swift
//  MapKitSwiftUI
//
//  Created by Armaghan Asghar on 8/9/24.
//

// \note We would need to observe this object from a view

import Foundation
import MapKit
import SwiftUI

class LocationsViewModel: ObservableObject {
    
    // All loaded locations
    @Published var locations: [Location]
    
    // Current location of map
    @Published var mapLocation: Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    
    // Current location of map span
    @Published var mapRegion: MKCoordinateRegion =
    MKCoordinateRegion()
    
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    // Show list of locations
    @Published var showLocationsList: Bool = false
    
    init() {
        let location = LocationsDataService.locations
        self.locations = location
        self.mapLocation = location.first!
        self.updateMapRegion(location: self.mapLocation)
        
    }
    
    private func updateMapRegion(location: Location)
    {
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(
                center: location.coordinates,
                span: mapSpan)
        }
    }
    
    public func toggleLocationLists() {
        withAnimation(.easeInOut) {
            showLocationsList.toggle()
        }
    }
    
    public func showNextLocation(location: Location) {
        withAnimation(.easeInOut) {
            mapLocation = location
            showLocationsList = false
        }
       
    }
    
    public func nextButtomPressed() {
        // find `mapLocation` in array
        // find the next of `mapLocation`
        guard let currentIndex = locations.firstIndex(where: {$0 == mapLocation}) else {
            print("Could not find current index in location")
            return
        }
        
        // 5 % 4
        let nextIndex = (currentIndex + 1) % locations.count
        
        showNextLocation(location: locations[nextIndex])
    }
    
}
