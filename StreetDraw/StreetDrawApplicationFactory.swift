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
    
    // todo: define more shapes
    
    return StreetDrawApplication(chapters: [
        Chapter(name: "Test", challenges: [
            Challenge(name: "Small Square", shape: square, minDistance: 100.0, maxDuration: 20.5, standardScore: 100, penaltyScore: nil, difficulty: .easy ),
            Challenge(name: "Small Rectangle", shape: rectangle, minDistance: 100.0, maxDuration: nil, standardScore: 100, penaltyScore: nil, difficulty: .easy ),
            Challenge(name: "Small Rectangle", shape: rhombus, minDistance: 100.0, maxDuration: nil, standardScore: 100, penaltyScore: nil, difficulty: .easy ),
            Challenge(name: "Big Square 2", shape: star, minDistance: 100.0, maxDuration: 20.5, standardScore: 100, penaltyScore: nil, difficulty: .normal ),
            Challenge(name: "Big Rectangle 2", shape: rectangle, minDistance: 100.0, maxDuration: nil, standardScore: 100, penaltyScore: nil, difficulty: .hard),
        ]),
        
        
        Chapter(name: "Introduction", challenges: [
            Challenge(name: "Small Square", shape: square, minDistance: 0.1 , maxDuration: nil, standardScore: 100, penaltyScore: nil, difficulty: .easy ),
            Challenge(name: "Small Rectangle", shape: rectangle, minDistance: 0.1, maxDuration: nil, standardScore: 100, penaltyScore: nil, difficulty: .easy )
        ]),
        Chapter(name: "Warmup", challenges: [
            Challenge(name: "Square", shape: square, minDistance: 0.5, maxDuration: nil, standardScore: 1000, penaltyScore: nil, difficulty: .easy ),
            Challenge(name: "Rectangle", shape: rectangle, minDistance: 0.5, maxDuration: nil, standardScore: 1000, penaltyScore: nil, difficulty: .easy )
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
