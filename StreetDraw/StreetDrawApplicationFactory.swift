//
//  StreetDrawApplicationFactory.swift
//  StreetDraw
//
//  Created by Roland Schmitz on 18.11.19.
//  Copyright © 2019 Roland Schmitz. All rights reserved.
//

import Foundation
import CoreGraphics

func createStreetDrawApplication() -> StreetDrawApplication {
    let square = Shape(points: [
        CGPoint(x: 0,y: 0),
        CGPoint(x: 0,y: 1),
        CGPoint(x: 1,y: 1),
        CGPoint(x: 1,y: 0),
        CGPoint(x: 0,y: 0)
    ])
    let rectangle = Shape(points: [
        CGPoint(x: 0,y: 0),
        CGPoint(x: 0,y: 1),
        CGPoint(x: 2,y: 1),
        CGPoint(x: 2,y: 0),
        CGPoint(x: 0,y: 0)
    ])
    let rhombus = Shape(points: [
        CGPoint(x: 0.5,y: 0),
        CGPoint(x: 0,y: 1),
        CGPoint(x: 0.5,y: 2),
        CGPoint(x: 1,y: 1),
        CGPoint(x: 0.5,y: 0)
    ])
    let star = Shape(points: [
        CGPoint(x: 1.5,y: 0),
        CGPoint(x: 1,y: 1),
        CGPoint(x: 0,y: 1),
        CGPoint(x: 1,y: 1.5),
        CGPoint(x: 0.5,y: 2.5),
        CGPoint(x: 1.5,y: 2),
        CGPoint(x: 2.5,y: 2.5),
        CGPoint(x: 2,y: 1.5),
        CGPoint(x: 3,y: 1),
        CGPoint(x: 2,y: 1),
        CGPoint(x: 1.5,y: 0)
    ])
    let pentagon = Shape(points: [
        CGPoint(x: 1.5,y: 0),
        CGPoint(x: 0,y: 1.25),
        CGPoint(x: 0.65,y: 2.75),
        CGPoint(x: 2.35,y: 2.75),
        CGPoint(x: 3,y: 1.25),
        CGPoint(x: 1.5,y: 0)
    ])
    let octagon = Shape(points: [
        CGPoint(x: 0.75,y: 0),
        CGPoint(x: 0,y: 0.75),
        CGPoint(x: 0,y: 1.75),
        CGPoint(x: 0.75,y: 2.5),
        CGPoint(x: 1.75,y: 2.5),
        CGPoint(x: 2.5,y: 1.75),
        CGPoint(x: 2.5, y: 0.75),
        CGPoint(x: 1.75,y: 0),
        CGPoint(x: 0.75,y: 0)
    ])
    let hexagon = Shape(points: [
        CGPoint(x: 0.75,y: 0),
        CGPoint(x: 0,y: 0.5),
        CGPoint(x: 0,y: 1.25),
        CGPoint(x: 0.75,y: 1.75),
        CGPoint(x: 1.5,y: 1.25),
        CGPoint(x: 1.5,y: 0.5),
        CGPoint(x: 0.75,y: 0)
    ])
    let bottle = Shape(points: [
        CGPoint(x: 0.25,y: 0),
        CGPoint(x: 0.25,y: 0.25),
        CGPoint(x: 0,y: 1.25),
        CGPoint(x: 0,y: 3),
        CGPoint(x: 0.75,y: 3),
        CGPoint(x: 0.75,y: 1.25),
        CGPoint(x: 0.5, y: 0.25),
        CGPoint(x: 0.5,y: 0),
        CGPoint(x: 0.25,y: 0)
    ])
    let flute = Shape(points: [
        CGPoint(x: 0,y: 0),
        CGPoint(x: 1,y: 1.5),
        CGPoint(x: 1,y: 2.75),
        CGPoint(x: 0.5,y: 3),
        CGPoint(x: 1.75,y: 3),
        CGPoint(x: 1.25,y: 2.75),
        CGPoint(x: 1.25, y: 1.5),
        CGPoint(x: 2.25,y: 0),
        CGPoint(x: 0,y: 0)
    ])
    let triangle = Shape(points: [
        CGPoint(x: 1.5,y: 0),
        CGPoint(x: 0,y: 3),
        CGPoint(x: 3,y: 3),
        CGPoint(x: 1.5,y: 0)
    ])
    let hLetter = Shape(points: [
        CGPoint(x: 0,y: 0),
        CGPoint(x: 0,y: 3),
        CGPoint(x: 0.75,y: 3),
        CGPoint(x: 0.75,y: 1.875),
        CGPoint(x: 2.25,y: 1.875),
        CGPoint(x: 2.25,y: 3),
        CGPoint(x: 3, y: 3),
        CGPoint(x: 3,y: 0),
        CGPoint(x: 2.25,y: 0),
        CGPoint(x: 2.25,y: 1.125),
        CGPoint(x: 0.75,y: 1.125),
        CGPoint(x: 0.75,y: 0),
        CGPoint(x: 0,y: 0)
    ])
    let lLetter = Shape(points: [
        CGPoint(x: 0,y: 0),
        CGPoint(x: 0,y: 3),
        CGPoint(x: 2,y: 3),
        CGPoint(x: 2,y: 2.25),
        CGPoint(x: 0.75,y: 2.25),
        CGPoint(x: 0.75,y: 0),
        CGPoint(x: 0,y: 0)
    ])
    let cLetter = Shape(points: [
        CGPoint(x: 0,y: 0),
        CGPoint(x: 0,y: 3),
        CGPoint(x: 2.25,y: 3),
        CGPoint(x: 2.25,y: 2.25),
        CGPoint(x: 0.75,y: 2.25),
        CGPoint(x: 0.75,y: 0.75),
        CGPoint(x: 2.25,y: 0.75),
        CGPoint(x: 2.25,y: 0),
        CGPoint(x: 0,y: 0)
    ])
    let xLetter = Shape(points: [
        CGPoint(x: 0.5,y: 0),
        CGPoint(x: 0,y: 0.5),
        CGPoint(x: 1,y: 1.5),
        CGPoint(x: 0,y: 2.5),
        CGPoint(x: 0.5,y: 3),
        CGPoint(x: 1.5,y: 2),
        CGPoint(x: 2.5,y: 3),
        CGPoint(x: 3,y: 2.5),
        CGPoint(x: 2,y: 1.5),
        CGPoint(x: 3,y: 0.5),
        CGPoint(x: 2.5,y: 0),
        CGPoint(x: 1.5,y: 1),
        CGPoint(x: 0.5,y: 0)
    ])
    // todo: define more shapes
    
    return StreetDrawApplication(chapters: [
        Chapter(name: "Test", challenges: [
            Challenge(name: "Small Square", shape: xLetter, minDistance: 100.0, maxDuration: 20.5, standardScore: 100, penaltyScore: nil, difficulty: .easy ),
            Challenge(name: "Small Rectangle", shape: triangle, minDistance: 100.0, maxDuration: nil, standardScore: 100, penaltyScore: nil, difficulty: .easy ),
            Challenge(name: "Small Rectangle", shape: hLetter, minDistance: 100.0, maxDuration: nil, standardScore: 100, penaltyScore: nil, difficulty: .easy ),
            Challenge(name: "Big Square 2", shape: lLetter, minDistance: 100.0, maxDuration: 20.5, standardScore: 100, penaltyScore: nil, difficulty: .normal ),
            Challenge(name: "Big Rectangle 2", shape: cLetter, minDistance: 100.0, maxDuration: nil, standardScore: 100, penaltyScore: nil, difficulty: .hard),
        ]),
        
        
        Chapter(name: "Introduction", challenges: [
            Challenge(name: "Small Square", shape: square, minDistance: 0.1 , maxDuration: nil, standardScore: 100, penaltyScore: nil, difficulty: .easy ),
            Challenge(name: "Small Rectangle", shape: rectangle, minDistance: 0.1, maxDuration: nil, standardScore: 100, penaltyScore: nil, difficulty: .easy )
        ]),
        Chapter(name: "Warmup", challenges: [
            Challenge(name: "Square", shape: square, minDistance: 0.5, maxDuration: nil, standardScore: 1000, penaltyScore: nil, difficulty: .easy ),
            Challenge(name: "Rhombus", shape: rhombus, minDistance: 0.5, maxDuration: nil, standardScore: 1000, penaltyScore: nil, difficulty: .easy )
        ]),
        
        Chapter(name: "Get ready", challenges: [
            Challenge(name: "Square", shape: square, minDistance: 0.5, maxDuration: nil, standardScore: 1000, penaltyScore: nil, difficulty: .easy ),
            Challenge(name: "Rectangle", shape: rectangle, minDistance: 1.0, maxDuration: nil, standardScore: 1000, penaltyScore: nil, difficulty: .easy )
        ]),
        
        Chapter(name: "Engaging", challenges: [
            // todo
        ]),
        Chapter(name: "Serious", challenges: [
            // todo
        ]),
        Chapter(name: "Challenging", challenges: [
            // todo
        ]),
        Chapter(name: "Crazy", challenges: [
            // todo
        ]),
        Chapter(name: "Impossible", challenges: [
            // todo
        ]),
        Chapter(name: "Antonio", challenges: [
            // todo
        ]),
        Chapter(name: "Luigi", challenges: [
            // todo
        ]),
        Chapter(name: "Pasquale", challenges: [
            // todo
        ]),
        Chapter(name: "Roland", challenges: [
            // todo
        ]),
        Chapter(name: "Tareq", challenges: [
            // todo
        ])
    ])
}
