//
//  ShapeView.swift
//  StreetDraw
//
//  Created by Roland Schmitz on 20.11.19.
//  Copyright © 2019 Roland Schmitz. All rights reserved.
//

import UIKit

@IBDesignable
class ShapeView: UIView {
    
    var shape: Shape?
    
    var path: UIBezierPath!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.darkGray
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
    override func draw(_ rect: CGRect) {
        print("draw")
        
        path = UIBezierPath()
        path.lineWidth = 4.0
        path.lineCapStyle = .round
        path.lineJoinStyle = .round
        tintColor.setStroke()
        
        
        if let shape = shape, shape.points.count > 1 {
            let scale: CGFloat = 20.0

            print("draw with shape")
            
            path.move(to: CGPoint(x: shape.points[0].x  * scale + 2, y: shape.points[0].y * scale + 2))
            
            for point in shape.points.dropFirst() {
                path.addLine(to: CGPoint(x: point.x  * scale + 2, y: point.y * scale + 2))
            }
            path.stroke()

        } else {
            // Draw a cross in case we dont have a shape
            path.move(to: CGPoint(x: 0.0 , y: 0.0))
            path.addLine(to: CGPoint( x: self.bounds.width, y: self.bounds.height))
            path.move(to: CGPoint(x: 0.0 , y: self.bounds.height))
            path.addLine(to: CGPoint( x: self.bounds.width, y: 0.0))
            path.stroke()
        }
    }
    
    
    func show(shape: Shape){
        self.shape = shape
    }
    
    
    
    
    
}


