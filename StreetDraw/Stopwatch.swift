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
var activeDur: TimeInterval = 0.0
var isCont: Int = 0


class Stopwatch {
    func start() {
        startingTime = Date().timeIntervalSince1970
    }
    
    func stop() {
        stopingTime = Date().timeIntervalSince1970
        isCont = 0
        activeDur = stopingTime-startingTime-totalPauseTime
        
    }
    
    func pause() {
        // todo
        lastPauseTime = Date().timeIntervalSince1970
        isCont = 0
        activeDur = lastPauseTime - startingTime - totalPauseTime
        
        
        
    }
    
    func `continue`() {
        let cont = Date().timeIntervalSince1970
        totalPauseTime += cont - lastPauseTime
        lastPauseTime = 0.0
        isCont = 1
    }
    
    var overallDuration: TimeInterval {
        return stopingTime - startingTime
        
    }

    var activeDuration: TimeInterval {
     if (activeDur == 0.0) {
                activeDur = Date().timeIntervalSince1970 - startingTime
                return activeDur
            
            }else if(isCont == 1 ){
                
                activeDur = Date().timeIntervalSince1970 - startingTime - totalPauseTime
                return activeDur
            }else{
                return activeDur
            }
    }
    

}
