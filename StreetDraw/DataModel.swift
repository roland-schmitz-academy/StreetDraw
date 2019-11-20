//
//  DataModel.swift
//  StreetDraw
//
//  Created by Roland Schmitz on 18.11.19.
//  Copyright © 2019 Roland Schmitz. All rights reserved.
//

import Foundation
import CoreGraphics
import CoreLocation

struct Shape {
    let points: [CGPoint]
}

enum Difficulty {
    case easy, normal, hard
}

struct Challenge {
    let name: String
    let shape: Shape
    // Distance in kilometers
    let minDistance: CLLocationDistance
    let maxDuration: TimeInterval?
    let standardScore: Int
    // penalty per second of app usage
    let penaltyScore: Int?
    let difficulty: Difficulty
}

struct Chapter {
    let name: String
    let challenges: [Challenge]
}

class Track {
    // todo: mutable collection of locations from LocationManager
}

struct Game {
    let challenge: Challenge
    let chapter: Chapter
    let track = Track()
    let stopwatch = Stopwatch()
}

class Achievements {
    // todo
}

class StreetDrawApplication {
    let chapters: [Chapter]
    let achievements = Achievements()
    let currentGame: Game? = nil
    init(chapters: [Chapter]) {
        self.chapters = chapters
    }
}




