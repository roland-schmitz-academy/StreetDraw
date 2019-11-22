//
//  timeToString.swift
//  StreetDraw
//
//  Created by Pasquale Moscillo on 22/11/2019.
//  Copyright © 2019 Roland Schmitz. All rights reserved.
//

import Foundation

func timeToString(from timeInterval: TimeInterval) -> String {

    let seconds = Int(timeInterval.truncatingRemainder(dividingBy: 60))
    let minutes = Int(timeInterval.truncatingRemainder(dividingBy: 60 * 60) / 60)
    let hours = Int(timeInterval / 3600)

    return String(format: "%.2d:%.2d:%.2d", hours, minutes, seconds)

}
