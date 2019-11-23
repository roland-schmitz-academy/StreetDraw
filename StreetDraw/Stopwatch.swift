//  Stopwatch.swift
//  StreetDraw
//
//  Created by Roland Schmitz on 18.11.19.
//  Copyright © 2019 Roland Schmitz. All rights reserved.
//

import Foundation

var startingTime:TimeInterval = 0.0
var stopingTime : TimeInterval = 0.0
var lastPauseTime: TimeInterval = 0.0
var totalPauseTime : TimeInterval = 0.0


class Stopwatch {
    func start() {
        // todo
        startingTime = Date().timeIntervalSince1970
        
    }
    
    func stop() {
        stopingTime = Date().timeIntervalSince1970
    }
    
    func pause() {
        // todo
        lastPauseTime = Date().timeIntervalSince1970
        
        
        
        
    }
    
    func `continue`() {
        totalPauseTime += Date().timeIntervalSince1970 - lastPauseTime
        lastPauseTime = 0.0
    }
    
    var overallDuration: TimeInterval {
        // todo
         return stopingTime - startingTime
        
    }

    var activeDuration: TimeInterval {
        var now = Date().timeIntervalSince1970
        return now - startingTime-totalPauseTime

    }

}
