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
    
    @IBInspectable
    var lineWidth: CGFloat = 4.0
    
    var shape: Shape?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.darkGray
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        var path: UIBezierPath!

        path = UIBezierPath()
        path.lineWidth = lineWidth
        path.lineCapStyle = .round
        path.lineJoinStyle = .round
        tintColor.setStroke()

        let drawingPoints = getDrawingPoints()

        if let firstPoint = drawingPoints.first {
            path.move(to: firstPoint)
            for drawingPoint in drawingPoints {
                path.addLine(to: drawingPoint)
            }
        } else {
            // Draw a cross in case we dont have a shape
            path.move(to: CGPoint(x: 0.0 , y: 0.0))
            path.addLine(to: CGPoint( x: self.bounds.width, y: self.bounds.height))
            path.move(to: CGPoint(x: 0.0 , y: self.bounds.height))
            path.addLine(to: CGPoint( x: self.bounds.width, y: 0.0))
        }
        path.stroke()
    }
    
    func getDrawingPoints() -> [CGPoint] {
        
        var drawingPoints: [CGPoint] = []
        
        if let shape = shape, shape.points.count > 1 {
            
            var minx : CGFloat = CGFloat.infinity
            var maxx: CGFloat = -CGFloat.infinity
            var miny : CGFloat = CGFloat.infinity
            var maxy: CGFloat = -CGFloat.infinity

            for point in shape.points {
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
            let w2 = self.bounds.width - lineWidth
            let h2 = self.bounds.height - lineWidth
            let scale1 = w2 / sw
            let scale2 = h2 / sh
            let scale = min(scale1, scale2)
            
            let dx = (lineWidth + w2 - sw * scale) / 2.0
            let dy = (lineWidth + h2 - sh * scale) / 2.0

            for point in shape.points {
                drawingPoints.append(CGPoint(x: (point.x - minx) * scale + dx,y: (point.y - miny) * scale + dy))
            }
            
            print("converted: \(drawingPoints)")
            
        }
        print("This is the drawing points \(drawingPoints)")
        return drawingPoints
    }
    
    
    
    
    func show(shape: Shape?){
        self.shape = shape
        setNeedsDisplay()
    }
    
}


