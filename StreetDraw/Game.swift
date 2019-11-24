//
//  Game.swift
//  StreetDraw
//
//  Created by Roland Schmitz on 23.11.19.
//  Copyright © 2019 Roland Schmitz. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation
import MapKit

class Game: NSObject, CLLocationManagerDelegate {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let chapter: Chapter
    let challenge: Challenge
    let track = Track()
    let stopwatch = Stopwatch()
    var started = false
    var ended = false
    private var viewController: PlayGameViewController?
    
    init(chapter: Chapter, challenge: Challenge) {
        self.chapter = chapter
        self.challenge = challenge
    }
        
    func start(playGameViewController: PlayGameViewController) -> Bool {
        if started { return false }
        started = true
        viewController = playGameViewController
        stopwatch.start()
        startTracking()
        return true
    }
    
    func pause() {
        stopwatch.pause()
    }
    
    func `continue`() {
        stopwatch.continue()
    }
    
    func end() -> Bool {
        if !started || ended { return false }
        ended = true
        stopTracking()
        stopwatch.stop()
        viewController = nil
        return true
    }

    var gameResult: GameResult {
        get {
            // todo calculate accuracy and score and replace fake values with actual values
            return GameResult(chapter: chapter, challenge: challenge, track: track, distance: track.distance, duration: stopwatch.activeDuration, accuracy: 0.17, score: 123)
        }
    }
    
    func startTracking() {
        print("#################### Start tracking locations")
        appDelegate.locationManager?.delegate = self
        appDelegate.requestLocationAuthorization()
        //appDelegate.locationManager?.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        appDelegate.locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        appDelegate.locationManager?.activityType = .fitness
        appDelegate.locationManager?.pausesLocationUpdatesAutomatically = false
        appDelegate.locationManager?.showsBackgroundLocationIndicator = true
        appDelegate.locationManager?.startUpdatingLocation()
    }

    func stopTracking() {
        print("#################### Stop tracking locations")
        appDelegate.locationManager?.stopUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("######## didUpdateLocations \(locations)")
        let optionalLastLocation = track.lastLocation
        track.addLocations(newLocations: locations)
        if let overlay = createOverlay(previousLocation: optionalLastLocation, newLocations: locations) {
            viewController?.addTrackOverlay(overlay: overlay)
        }
        
    }

    func locationManagerDidPauseLocationUpdates(_ manager: CLLocationManager) {
        print("######## locationManagerDidPauseLocationUpdates")
    }
    
    func locationManagerDidResumeLocationUpdates(_ manager: CLLocationManager) {
        print("######## locationManagerDidResumeLocationUpdates")
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("######## didFailWithError")
    }
}

