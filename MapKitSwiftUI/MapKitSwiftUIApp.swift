//
//  MapKitSwiftUIApp.swift
//  MapKitSwiftUI
//
//  Created by Armaghan Asghar on 8/9/24.
//

import SwiftUI

@main
struct MapKitSwiftUIApp: App {
    
    @StateObject private var vm = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
        }
    }
}
