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
import MapKit

struct Shape {
    let points: [CGPoint]
}

enum Difficulty {
    case easy, normal, hard
}

struct Challenge: Equatable {
    static func == (lhs: Challenge, rhs: Challenge) -> Bool {
        return lhs.name == rhs.name
    }
    
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

struct Chapter: Equatable {
    static func == (lhs: Chapter, rhs: Chapter) -> Bool {
        return lhs.name == rhs.name
    }
    let name: String
    let challenges: [Challenge]
}

class Track {
    var locations: [CLLocation] = []
    
    var lastLocation: CLLocation? { locations.last }
    
    func addLocations(newLocations: [CLLocation]) {
        let accurateLocations = newLocations // todo fix this: newLocations.filter { location in location.horizontalAccuracy >= 0.0 && location.horizontalAccuracy < 100.0 }
        locations += accurateLocations
    }
    
    var distance: CLLocationDistance {
        var accumulatedDistance = 0.0
        if var previousMapPoint = locations.first {
            locations.dropFirst().forEach { nextMapPoint in
                accumulatedDistance += previousMapPoint.distance(from: nextMapPoint)
                previousMapPoint = nextMapPoint
            }
        }
        return accumulatedDistance
    }
    
    func createOverlay() -> MKOverlay? {
        return Walk_n_Draw.createOverlay(locations: locations)
    }
}

struct GameResult {
    let chapter: Chapter
    let challenge: Challenge
    let track: Track
    let distance: CLLocationDistance
    let duration: TimeInterval
    let accuracy: Float
    let score: Int
}

struct Achievements {
    let results: [GameResult]
}

class StreetDrawApplication {
    let chapters: [Chapter]
    let achievements: Achievements
    let currentGame: Game? = nil
    init(chapters: [Chapter]) {
        self.chapters = chapters
        // only for testing:
        self.achievements = Achievements(results: [
            GameResult(chapter: chapters[0], challenge: chapters[0].challenges[0], track: Track(), distance: 12345, duration: 1234, accuracy: 0.78, score: 12435),
            GameResult(chapter: chapters[0], challenge: chapters[0].challenges[1], track: Track(), distance: 12344, duration: 1235, accuracy: 0.11, score: 12312),
            GameResult(chapter: chapters[3], challenge: chapters[3].challenges[0], track: Track(), distance: 12343, duration: 1236, accuracy: 0.56, score: 5386),
            GameResult(chapter: chapters[3], challenge: chapters[3].challenges[1], track: Track(), distance: 12342, duration: 1237, accuracy: 0.87, score: 36)
        ])
    }
}

extension StreetDrawApplication {
    func getNextChapterAndChallenge(chapter: Chapter, challenge: Challenge) -> (Chapter, Challenge) {
        // todo search for the next challenge in the chapter or the first chapter in the next chapter
        // structs are not always the best structures, todo: refactor chapters an challenges
        let challengesIndex = chapter.challenges.firstIndex(where: {$0 == challenge})!
        if challengesIndex < chapter.challenges.count - 1 {
            print("next challenge")
            return (chapter, chapter.challenges[challengesIndex + 1])
        }
        let chapterIndex = chapters.firstIndex(where: {$0 == chapter})!
        if chapterIndex < chapters.count - 1 {
            let nextChapter = chapters[chapterIndex + 1]
            if nextChapter.challenges.count > 0 {
                print("next chapter")
                return (nextChapter, nextChapter.challenges[0])
            }
        }
        // no next chapter found, so use the same again
        return (chapter, challenge)
    }
}


