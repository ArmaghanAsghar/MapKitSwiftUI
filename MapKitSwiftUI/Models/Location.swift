//
//  Location.swift
//  MapKitSwiftUI
//
//  Created by Armaghan Asghar on 8/9/24.
//

import Foundation
import MapKit

// \brief Data model for each location
struct Location: Identifiable, Equatable {
  
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
    
    var id: String {
        return name + cityName
    }
    
    static func == (lhs: Location, rhs: Location) -> Bool {
        return lhs.id == rhs.id
    }
    
}
