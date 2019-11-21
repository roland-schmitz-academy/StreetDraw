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
        
        var path: UIBezierPath!
        
        path = UIBezierPath()
        path.lineWidth = 4.0
        path.lineCapStyle = .round
        path.lineJoinStyle = .round
        tintColor.setStroke()
        
        if let shape = shape, shape.points.count > 1 {//if we can draw the shape
            
            var minx : CGFloat = CGFloat.greatestFiniteMagnitude, maxx: CGFloat = CGFloat.leastNormalMagnitude
            var miny : CGFloat = CGFloat.greatestFiniteMagnitude, maxy: CGFloat = CGFloat.leastNormalMagnitude
        
//            Calculate the constraints to draw the shapes
            for point in shape.points.dropFirst() {
                if (point.x < minx){
                    minx = point.x
                }
                if (point.y < miny) {
                    miny = point.y
                }
                if (point.x > maxx){
                    maxx = point.x
                }
                if (point.y > maxy) {
                    maxy = point.y
                }
                
            }
            let sw = maxx - minx
            let sh = maxy - miny
            let w2 = self.bounds.width - 4
            let h2 = self.bounds.height - 4
            let scale1 = w2 / sw
            let scale2 = h2 / sh
            let scale = min(scale1, scale2)
            
            let dx = 2 + (w2 - sw * scale) / 2.0
            let dy = 2 + (h2 - sh * scale) / 2.0
            
            path.move(to: CGPoint(x: shape.points[0].x  * scale + dx, y: shape.points[0].y * scale + dy))
            
            for point in shape.points.dropFirst() {
                path.addLine(to: CGPoint(x: point.x  * scale + dx, y: point.y * scale + dy))
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
        setNeedsDisplay()
    }
    
}


