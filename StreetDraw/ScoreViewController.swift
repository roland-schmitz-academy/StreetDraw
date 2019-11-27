//
//  ScoreViewController.swift
//  StreetDraw
//
//  Created by Roland Schmitz on 17.11.19.
//  Copyright © 2019 Roland Schmitz. All rights reserved.
//

import UIKit
import MapKit

class ScoreViewController: UIViewController, MKMapViewDelegate {
    var gameResult: GameResult?
    
    var shapeOverlay: MKOverlay?
    var trackOverlay: MKOverlay?
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var trackShapeView: ShapeView!
    @IBOutlet weak var shapeView: ShapeView!
    @IBOutlet weak var accuracyLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var blueBoxView: UIView!
    
    // todo Pasquale: add outlets for result labels
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        print("ScoreViewController.viewDidLoad()")
    }

    override func viewWillAppear(_ animated: Bool) {
        print("ScoreViewController.viewWillAppear()")
        setupUserTrackingButton()
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .none

        // fill the labels wuth the game results:
        accuracyLabel.text = String(format: "%0.1f %%", (gameResult?.accuracy ?? 0.0) * 100)
        pointsLabel.text = "\(gameResult?.score ?? 0)"
        distanceLabel.text = formatDistance(distance: gameResult?.distance)
        timeLabel.text = timeToString(from: gameResult?.duration ?? 0.0)

        showShapesOnMap()
        showShapesInBlueBox()
    }
    
    func showShapesOnMap() {
        
        // add the shapeOverlay to the map
        if let shapeOverlay = shapeOverlay {
            mapView.addOverlay(shapeOverlay)
        }

        // add the final trackOverlay to the map
        if let trackOverlay = trackOverlay {
            mapView.addOverlay(trackOverlay)
        }

    }
    
    fileprivate func setVisibleMapRectToShowShapes() {
        let shapeOverlayBounds = shapeOverlay?.boundingMapRect
        let trackOverlayBounds = trackOverlay?.boundingMapRect
        
        // calculate the union of shape and track to show them both in the final mapview
        var bounds: MKMapRect?
        if let shapeBounds = shapeOverlayBounds, let trackBounds = trackOverlayBounds {
            bounds = shapeBounds.union(trackBounds)
        }
        else {
            bounds = shapeOverlayBounds ?? trackOverlayBounds
        }
        if let bounds = bounds {
            print("mapView.frame.maxY: \(mapView.frame.maxY)")
            print("mapView.frame.minY: \(mapView.frame.minY)")
            print("blueBoxView.frame.maxY: \(blueBoxView.frame.maxY)")
            print("blueBoxView.frame.minY: \(blueBoxView.frame.minY)")
            let topHeight = blueBoxView.frame.minY - mapView.frame.minY
            let heightFactor = mapView.bounds.height / topHeight
            print("hightFactor: \(heightFactor)")
            let sideMargin = bounds.width / 10
            let topMargin = bounds.width / 10
            let bottomMargin = (bounds.width / 5) * Double(heightFactor)

            let marginBounds = MKMapRect(x: bounds.origin.x - sideMargin, y: bounds.origin.y - topMargin, width: bounds.width + sideMargin * 2, height: bounds.height * Double(heightFactor) + topMargin + bottomMargin)
            
            mapView.setVisibleMapRect(marginBounds, animated: true)
        }
    }
    
    func showShapesInBlueBox() {
        // show the shape in the results box
        self.shapeView.show(shape: createShape(points: getPointOfOverlay(shapeOverlay: self.shapeOverlay)))
        
        // show the track in the results box
        self.trackShapeView.show(shape: createShape(points: getPointOfOverlay(shapeOverlay: self.trackOverlay)))
        
        // show shape and track together inside the ShapeView boxes
        print("show shape and track together inside the ShapeView boxes")
        if let shapeBounds = self.shapeView.shapeBounds, let trackShapeBounds = self.trackShapeView.shapeBounds {
            let unionBounds = shapeBounds.union(trackShapeBounds)
            self.shapeView.shapeBounds = unionBounds
            self.trackShapeView.shapeBounds = unionBounds
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("ScoreViewController.viewDidAppear()")
        //mapView.showsUserLocation = true
        self.setVisibleMapRectToShowShapes()
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
          print("render!")
          let renderer = MKPolylineRenderer(overlay: overlay as! MKPolyline)
          if overlay === self.shapeOverlay {
              renderer.strokeColor = .systemGray // challenge?.difficulty.getColor()
              renderer.alpha = 0.4
          } else {
              renderer.strokeColor = .systemBlue
              renderer.alpha = 0.8
          }
          renderer.lineWidth = 8
          return renderer

      }
    
    func setupUserTrackingButton() {
        let button = MKUserTrackingButton(mapView: mapView)
        button.layer.backgroundColor = UIColor(white: 1, alpha: 0.7).cgColor
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 4
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)

        NSLayoutConstraint.activate([button.bottomAnchor.constraint(equalTo: mapView.bottomAnchor, constant: -10),
                                     button.trailingAnchor.constraint(equalTo: mapView.trailingAnchor, constant: -10)])
    }

    func prepareForGameResult(gameResult: GameResult) {
        self.gameResult = gameResult
    }

    @IBAction func challengesButtonTouched(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.startGameViewController?.dismiss(animated: true, completion: {
            appDelegate.startGameViewController?.navigationController?.popViewController(animated: true)
        })
    }
    @IBAction func retryButtonTouched(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.startGameViewController?.dismiss(animated: true, completion: {
            print("dismiss ready")
        })
    }
    @IBAction func nextChallengeButtonTouched(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        if let startGameViewController = appDelegate.startGameViewController {
            let (chapter, challenge) = appDelegate.streetDrawApp!.getNextChapterAndChallenge(chapter: startGameViewController.chapter!, challenge: startGameViewController.challenge!)
            startGameViewController.prepareFor(chapter: chapter, challenge: challenge)
            startGameViewController.updateValues()
            startGameViewController.dismiss(animated: true, completion: {
                print("dismiss ready")
            })
        }
    }
    
    func prepareOverlays(shapeOverlay: MKOverlay?, trackOverlay: MKOverlay?) {
        self.shapeOverlay = shapeOverlay
        self.trackOverlay = trackOverlay
    }
    
    func getPointOfOverlay(shapeOverlay: MKOverlay?)-> [CGPoint]{
        var points: [CGPoint] = []
//        self.shapeOverlay = shapeOverlay
        if let polyline = shapeOverlay as? MKPolyline {
            let coordinates = polyline.coordinates
            for coordinate in coordinates {
                let mapPoint = MKMapPoint(coordinate)
                points.append(CGPoint(x: mapPoint.x, y: mapPoint.y))
            }
        }
        return points
    }
    
    func createShape(points : [CGPoint]) -> Shape{
        let shape = Shape(points: points)
        return shape
    }
             
             
}




//
//func getShapeInPoints(overlay: MKOverlay){
//    if let polyline = shapeOverlay as? MKPolyline {
//        let coordinates: [CLLocationCoordinate2D] = polyline.coordinates
//        let points: [CGPoint] = convertToCgpoint(coordinates: [CLLocationCoordinate2D])
//       }
//}
//func convertToCgpoint(coordinates: [CLLocationCoordinate2D]) -> [CGPoint]{
//         var points: [CGPoint] = []
//         var point: CGPoint
//    for coordinate in coordinates{
//        point.x = CGFloat(coordinate.latitude)
//        point.y = CGFloat(coordinate.longitude)
//        points.append(point)
//
//
//    }
//    return points
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


