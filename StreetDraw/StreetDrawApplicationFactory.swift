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
        CGPoint(x: 3,y: -3),
        CGPoint(x: 3,y: -10),
        CGPoint(x: 10,y: -10),
        CGPoint(x: 10,y: -3),
        CGPoint(x: 3,y: -3)
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
    let antonio = Shape(points: [
        CGPoint(x: 1,y: 0),
        CGPoint(x: 1,y: 0.5),
        CGPoint(x: 0.5,y: 0.5),
        CGPoint(x: 0.5,y: 1),
        CGPoint(x: 0.5,y: 1),
        CGPoint(x: 0,y: 1),
        CGPoint(x: 0,y: 1.5),
        CGPoint(x: 0.5,y: 1.5),
        CGPoint(x: 0.5,y: 2),
        CGPoint(x: 1,y: 2),
        CGPoint(x: 1,y: 2.5),
        CGPoint(x: 1.5,y: 2.5),
        CGPoint(x: 1.5,y: 2),
        CGPoint(x: 2,y: 2),
        CGPoint(x: 2,y: 1.5),
        CGPoint(x: 2.5,y: 1.5),
        CGPoint(x: 2.5,y: 1),
        CGPoint(x: 2,y: 1),
        CGPoint(x: 2,y: 0.5),
        CGPoint(x: 1.5,y: 0.5),
        CGPoint(x: 1.5,y: 0),
        CGPoint(x: 1,y: 0)
    ])
    let heart = Shape(points: [
        CGPoint(x: 8, y: 0),
        CGPoint(x: 6.5, y: 0.2),
        CGPoint(x: 5, y: 1),
        CGPoint(x: 3, y: 2),
        CGPoint(x: 2, y: 3),
        CGPoint(x: 1, y: 5),
        CGPoint(x: 0, y: 8),
        CGPoint(x: 0, y: 10),
        CGPoint(x: 1, y: 13),
        CGPoint(x: 2, y: 15),
        CGPoint(x: 4, y: 17),
        CGPoint(x: 6, y: 18),
        CGPoint(x: 8, y: 19),
        CGPoint(x: 10, y: 21),
        CGPoint(x: 12, y: 23),
        CGPoint(x: 13, y: 25),
        CGPoint(x: 14, y: 27),
        CGPoint(x: 15, y: 30),
        CGPoint(x: 16, y: 27),
        CGPoint(x: 17, y: 25),
        CGPoint(x: 18, y: 23),
        CGPoint(x: 20, y: 21),
        CGPoint(x: 22, y: 19),
        CGPoint(x: 24, y: 18),
        CGPoint(x: 26, y: 17),
        CGPoint(x: 28, y: 15),
        CGPoint(x: 29, y: 13),
        CGPoint(x: 30, y: 10),
        CGPoint(x: 30, y: 8),
        CGPoint(x: 29, y: 5),
        CGPoint(x: 28, y: 3),
        CGPoint(x: 27, y: 2),
        CGPoint(x: 25, y: 1),
        CGPoint(x: 23.5, y: 0.2),
        CGPoint(x: 22, y: 0),
        CGPoint(x: 20, y: 0),
        CGPoint(x: 18.2, y: 0.8),
        CGPoint(x: 17, y: 2),
        CGPoint(x: 15, y: 5),
        CGPoint(x: 13, y: 2),
        CGPoint(x: 11.6, y: 0.8),
        CGPoint(x: 10, y: 0),
        CGPoint(x: 8, y: 0)
    ])
    
    
    // todo: define more shapes
    
    return StreetDrawApplication(chapters: [
//        Chapter(name: "Test", challenges: [
//            Challenge(name: "Small Square", shape: antonio, minDistance: 100.0, maxDuration: 20.5, standardScore: 100, penaltyScore: nil, difficulty: .easy ),
//            Challenge(name: "Small Rectangle", shape: heart, minDistance: 100.0, maxDuration: nil, standardScore: 100, penaltyScore: nil, difficulty: .easy ),
//           Challenge(name: "Small Rectangle", shape: hLetter, minDistance: 100.0, maxDuration: nil, standardScore: 100, penaltyScore: nil, difficulty: .easy ),
//           Challenge(name: "Big Square 2", shape: lLetter, minDistance: 100.0, maxDuration: 20.5, standardScore: 100, penaltyScore: nil, difficulty: .normal ),
//            Challenge(name: "Big Rectangle 2", shape: cLetter, minDistance: 100.0, maxDuration: nil, standardScore: 100, penaltyScore: nil, difficulty: .hard),
//        ]),
//
        
        Chapter(name: "Introduction", challenges: [
            Challenge(name: "Small Square", shape: square, minDistance: 0.1 , maxDuration: 600, standardScore: 100, penaltyScore: nil, difficulty: .easy ),
            Challenge(name: "Small Rectangle", shape: rectangle, minDistance: 0.1, maxDuration: nil, standardScore: 100, penaltyScore: nil, difficulty: .easy )
        ]),
        Chapter(name: "Warmup", challenges: [
            Challenge(name: "Square", shape: square, minDistance: 0.3, maxDuration: nil, standardScore: 1000, penaltyScore: nil, difficulty: .easy ),
            Challenge(name: "Rectangle", shape: rectangle, minDistance: 0.3, maxDuration: nil, standardScore: 1000, penaltyScore: nil, difficulty: .easy ),
            Challenge(name: "Rhombus", shape: rhombus, minDistance: 0.3, maxDuration: nil, standardScore: 1000, penaltyScore: nil, difficulty: .easy )
        ]),
        
        Chapter(name: "Get ready", challenges: [
            Challenge(name: "Triangle", shape: triangle, minDistance: 0.7, maxDuration: nil, standardScore: 1000, penaltyScore: nil, difficulty: .easy ),
            Challenge(name: "Star", shape: star, minDistance: 0.7, maxDuration: nil, standardScore: 1000, penaltyScore: nil, difficulty: .normal )
        ]),
        
        Chapter(name: "Challenging", challenges: [
            Challenge(name: "Pentagon", shape: pentagon, minDistance: 1.0, maxDuration: nil, standardScore: 1000, penaltyScore: nil, difficulty: .easy ),
            Challenge(name: "Hexagon", shape: hexagon, minDistance: 1.0, maxDuration: nil, standardScore: 1000, penaltyScore: nil, difficulty: .normal ),
            Challenge(name: "Octagon", shape: octagon, minDistance: 1.5, maxDuration: nil, standardScore: 1000, penaltyScore: nil, difficulty: .hard)
        ]),
        
        Chapter(name: "Engaging", challenges: [
            Challenge(name: "Flute", shape: flute, minDistance: 1.5, maxDuration: nil, standardScore: 1000, penaltyScore: nil, difficulty: .normal),
            Challenge(name: "Bottle", shape: bottle, minDistance: 2.0, maxDuration: nil, standardScore: 1000, penaltyScore: nil, difficulty: .hard )
        ]),
        
        Chapter(name: "Serious", challenges: [
            Challenge(name: "H letter", shape: hLetter, minDistance: 3.0, maxDuration: nil, standardScore: 1000, penaltyScore: nil, difficulty: .normal ),
            Challenge(name: "L letter", shape: lLetter, minDistance: 2.5, maxDuration: nil, standardScore: 1000, penaltyScore: nil, difficulty: .easy ),
            Challenge(name: "C letter", shape: cLetter, minDistance: 3.0, maxDuration: nil, standardScore: 1000, penaltyScore: nil, difficulty: .normal),
            Challenge(name: "X letter", shape: xLetter, minDistance: 4.5, maxDuration: nil, standardScore: 1000, penaltyScore: nil, difficulty: .hard )
        ]),
        
        Chapter(name: "Crazy", challenges: [
        
        ]),
        Chapter(name: "Impossible", challenges: [
            Challenge(name: "Heart", shape: heart, minDistance: 10, maxDuration: nil, standardScore: 1000, penaltyScore: nil, difficulty: .hard )
        ]),
//        Chapter(name: "Antonio", challenges: [
//            // todo
//        ]),
//        Chapter(name: "Luigi", challenges: [
//            // todo
//        ]),
//        Chapter(name: "Pasquale", challenges: [
//            // todo
//        ]),
//        Chapter(name: "Roland", challenges: [
//            // todo
//        ]),
//        Chapter(name: "Tareq", challenges: [
//            // todo
//        ])
    ])
}
