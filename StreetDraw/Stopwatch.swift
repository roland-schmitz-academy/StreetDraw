//  Stopwatch.swift
//  StreetDraw
//
//  Created by Roland Schmitz on 18.11.19.
//  Copyright © 2019 Roland Schmitz. All rights reserved.
//

import Foundation

class Stopwatch {
    var startingTime:TimeInterval = 0.0
    var stopingTime : TimeInterval = 0.0
    var lastPauseTime: TimeInterval = 0.0
    var totalPauseTime : TimeInterval = 0.0
    var activeDur: TimeInterval = 0.0
    var started:Bool = false
    var paused:Bool = false
    
    func start() {
        startingTime = Date().timeIntervalSince1970
        started = true
        paused = false
        
    }
    
    func stop() {
        stopingTime = Date().timeIntervalSince1970
        started = false
        paused = true
        
    }
    
    func pause() {
        // todo
        lastPauseTime = Date().timeIntervalSince1970
        paused = true
    }
    
    func `continue`() {
        let cont = Date().timeIntervalSince1970
        totalPauseTime += cont - lastPauseTime
        lastPauseTime = 0.0
        paused = false
        
    }
    
    var overallDuration: TimeInterval {
        return stopingTime - startingTime
        
    }

    var activeDuration: TimeInterval {
        if(!started && !paused){
            activeDur = 0.0
            return activeDur
        }
        else if (started && !paused) {
                activeDur = Date().timeIntervalSince1970 - startingTime - totalPauseTime
                return activeDur
            
            }else if (started && paused){
            activeDur  = lastPauseTime - startingTime - totalPauseTime
                return activeDur
        }else if (!started && paused){
             activeDur = stopingTime - startingTime - totalPauseTime
            return activeDur
        }
        return activeDur
    }
    

}
