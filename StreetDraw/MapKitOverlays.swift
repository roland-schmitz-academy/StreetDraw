//
//  MapKitOverlays.swift
//  StreetDraw
//
//  Created by Roland Schmitz on 22.11.19.
//  Copyright © 2019 Roland Schmitz. All rights reserved.
//

import Foundation
import MapKit

public extension MKMultiPoint {
    var coordinates: [CLLocationCoordinate2D] {
        var coords = [CLLocationCoordinate2D](repeating: kCLLocationCoordinate2DInvalid,
                                              count: pointCount)
        getCoordinates(&coords, range: NSRange(location: 0, length: pointCount))
        return coords
    }
}
