//
//  DistanceFormatter.swift
//  StreetDraw
//
//  Created by Roland Schmitz on 24.11.19.
//  Copyright © 2019 Roland Schmitz. All rights reserved.
//

import Foundation
import CoreLocation

func formatDistance(distance: CLLocationDistance?) -> String {
    let distance = distance ?? 0.0
    if(distance < 2000.0) {
        return String(format: "%.0f m", distance)
    }
    return String(format: "%.1f km", distance / 1000)
}
