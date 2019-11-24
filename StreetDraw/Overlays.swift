//
//  Overlays.swift
//  StreetDraw
//
//  Created by Roland Schmitz on 24.11.19.
//  Copyright © 2019 Roland Schmitz. All rights reserved.
//

import Foundation
import CoreLocation
import MapKit

func createOverlay(previousLocation: CLLocation?, newLocations: [CLLocation]) -> MKOverlay? {
    var locations: [CLLocation] = []
    if let lastLocation = previousLocation {
        locations.append(lastLocation)
    }
    locations.append(contentsOf: newLocations)
    return createOverlay(locations: locations)
}

func createOverlay(locations: [CLLocation]) -> MKOverlay? {
    return createOverlay(coordinates: locations.map { location in location.coordinate })
}

func createOverlay(coordinates: [CLLocationCoordinate2D]) -> MKOverlay? {
    guard coordinates.count > 1 else { return nil }
    return MKPolyline(coordinates: coordinates, count: coordinates.count)
}

