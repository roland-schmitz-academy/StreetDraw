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
    private var viewController: PlayGameViewController?
    
    init(chapter: Chapter, challenge: Challenge) {
        self.chapter = chapter
        self.challenge = challenge
        //testTwice()
    }
        
    func start(playGameViewController: PlayGameViewController) {
        viewController = playGameViewController
        stopwatch.start()
        startTracking()
    }
    
    func pause() {
        stopwatch.pause()
    }
    
    func `continue`() {
        stopwatch.continue()
    }
    
    func end() {
        stopTracking()
        stopwatch.stop()
        viewController = nil
    }

    var gameResult: GameResult {
        get {
            // todo calculate accuracy and score and replace fake values with actual values
            return GameResult(chapter: chapter, challenge: challenge, track: track, distance: 1234, duration: stopwatch.activeDuration, accuracy: 0.17, score: 123)
        }
    }
    
    func startTracking() {
        appDelegate.locationManager?.delegate = self
        appDelegate.requestLocationAuthorization()
        appDelegate.locationManager?.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        appDelegate.locationManager?.activityType = .fitness
        appDelegate.locationManager?.pausesLocationUpdatesAutomatically = false
        appDelegate.locationManager?.showsBackgroundLocationIndicator = true
        appDelegate.locationManager?.startUpdatingLocation()
    }

    func stopTracking() {
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

    func createOverlay(previousLocation: CLLocation?, newLocations: [CLLocation]) -> MKOverlay? {
        var coordinates: [CLLocationCoordinate2D] = []
        if let lastLocation = previousLocation?.coordinate {
            coordinates.append(lastLocation)
        }
        coordinates.append(contentsOf: newLocations.map { location in location.coordinate })
        guard coordinates.count > 1 else { return nil }
        return MKPolyline(coordinates: coordinates, count: coordinates.count)
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

