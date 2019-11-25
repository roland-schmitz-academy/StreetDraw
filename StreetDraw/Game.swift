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
    private var shapeOverlay: MKOverlay?
    
    init(chapter: Chapter, challenge: Challenge) {
        self.chapter = chapter
        self.challenge = challenge
    }
        
    func start(playGameViewController: PlayGameViewController!, shapeOverlay: MKOverlay!) -> Bool {
        if started { return false }
        started = true
        self.viewController = playGameViewController
        self.shapeOverlay = shapeOverlay
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
            let accuracy = calculateAccuracy(shapeOverlay: shapeOverlay, trackOverlay: track.createOverlay())
            let distance = track.distance
            let duration = stopwatch.activeDuration
            var score: Double = 0.0
            print("accuracy: \(accuracy)")
            if distance >= challenge.minDistance && duration <= (challenge.maxDuration ?? Double.infinity) {
                score = Double(challenge.standardScore) * distance / challenge.minDistance
                if let maxDuration = challenge.maxDuration {
                    score = score * maxDuration / duration
                }
                score *= accuracy
            }
            return GameResult(chapter: chapter, challenge: challenge, track: track, distance: distance, duration: duration, accuracy: Float(accuracy), score: Int(score))
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

    func calculateAccuracy(shapeOverlay: MKOverlay?, trackOverlay: MKOverlay?) -> Double {
        var accumulatedAcurracy = 0.0
        var numberOfChecks = 0

        func getAccuracyOf(distance: Double) -> Double {
            let accuracy: Double = 1.0 - ( max(100.0, min(distance, 500.0)) - 100.0) / 400.0
            //print("index \(numberOfChecks) distance \(distance) accuracy \(accuracy)")
            return accuracy
        }
        
        func aggregateAccuracyOfDistance(point: MKMapPoint, to referencePoints: [MKMapPoint]) {
            let distance = referencePoints.map { refPoint in refPoint.distance(to: point) }.min() ?? 500
            print("distance=\(distance)")
            accumulatedAcurracy += getAccuracyOf(distance: distance)
            numberOfChecks += 1
        }

        if let shapeCoordinates = (shapeOverlay as? MKPolyline)?.coordinates, let trackCoordinates = (trackOverlay as? MKPolyline)?.coordinates, trackCoordinates.count > 1 {
            let shapeMapPoints = shapeCoordinates.map { coordinate in MKMapPoint(coordinate)}
            let trackMapPoints = trackCoordinates.map { coordinate in MKMapPoint(coordinate)}
            (0..<shapeMapPoints.count - 1).forEach { shapeMapPointIndex in
                let startPoint = shapeMapPoints[shapeMapPointIndex]
                let endPoint = shapeMapPoints[shapeMapPointIndex+1]
                let sectionCount = Int(startPoint.distance(to: endPoint) / 100)
                let dx = (endPoint.x - startPoint.x) / Double(sectionCount)
                let dy = (endPoint.y - startPoint.y) / Double(sectionCount)
                (0..<sectionCount).forEach { sectionIndex in
                    let section = Double(sectionIndex)
                    let intermediatePoint = MKMapPoint(x: startPoint.x + section * dx, y: startPoint.y + section * dy )
                    aggregateAccuracyOfDistance(point: intermediatePoint, to: trackMapPoints)
                }
            }
            let averageAcurracy = accumulatedAcurracy / Double(numberOfChecks)
//            print("averageAcurracy: \(averageAcurracy)")
            return averageAcurracy
        }
//        print("no averageAcurracy returning 0.0")
        return 0.0
    }
    
}

