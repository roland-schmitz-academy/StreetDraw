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
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
    override func draw(_ rect: CGRect) {
        var path: UIBezierPath!

        path = UIBezierPath()
        path.lineWidth = lineWidth
        path.lineCapStyle = .round
        path.lineJoinStyle = .round
        tintColor.setStroke()
        
        if let shape = shape, shape.points.count > 1 {
            
            var minx : CGFloat = CGFloat.greatestFiniteMagnitude
            var maxx: CGFloat = -CGFloat.greatestFiniteMagnitude
            var miny : CGFloat = CGFloat.greatestFiniteMagnitude
            var maxy: CGFloat = -CGFloat.greatestFiniteMagnitude
            
            //            Calculate the constraints to draw the shapes
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
            
//            path.move(to: CGPoint(x: shape.points[0].x  * scale + dx, y: shape.points[0].y * scale + dy))
//
//            for point in shape.points.dropFirst() {
//                path.addLine(to: CGPoint(x: point.x  * scale + dx, y: point.y * scale + dy))
            path.move(to: CGPoint(x: (shape.points[0].x - minx)  * scale + dx, y: (shape.points[0].y - miny) * scale + dy))
               
               for point in shape.points.dropFirst() {
                   path.addLine(to: CGPoint(x: (point.x - minx)  * scale + dx, y: (point.y - miny) * scale + dy))
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
    
    
    
    
    func getDrawingPoints() -> [CGPoint] {
        
        var drawingPoints: [CGPoint] = []
        
        if let shape = shape, shape.points.count > 1 {
            
            var minx : CGFloat = CGFloat.greatestFiniteMagnitude
            var maxx: CGFloat = -CGFloat.greatestFiniteMagnitude
            var miny : CGFloat = CGFloat.greatestFiniteMagnitude
            var maxy: CGFloat = -CGFloat.greatestFiniteMagnitude
            
         
            
//            var minx : CGFloat = CGFloat.greatestFiniteMagnitude, maxx: CGFloat = CGFloat.leastNormalMagnitude
//            var miny : CGFloat = CGFloat.greatestFiniteMagnitude, maxy: CGFloat = CGFloat.leastNormalMagnitude
            
            //            Calculate the constraints to draw the shapes
//            for point in shape.points.dropFirst() {
            
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
//            print("min X : \(minx)")
//            print("min X : \(maxy)")

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


