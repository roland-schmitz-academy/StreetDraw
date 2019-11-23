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
    var shapeOverlay: MKOverlay?
    var trackOverlay: MKOverlay?
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ScoreViewController.viewDidLoad()")
    }

    override func viewWillAppear(_ animated: Bool) {
        print("ScoreViewController.viewWillAppear()")
        setupUserTrackingButton()
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        print("ScoreViewController.viewDidAppear()")
        mapView.showsUserLocation = true
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
    
    
  
    
    func getPointOfOverlay(shapeOverlay: MKOverlay)-> [CGPoint]{
        var points: [CGPoint] = []
        var point: CGPoint = CGPoint.init()
        self.shapeOverlay = shapeOverlay
        if let polyline = shapeOverlay as? MKPolyline {
            let coordinates = polyline.coordinates
            for coordinate in coordinates {
                point.x = CGFloat(coordinate.latitude)
                point.y = CGFloat(coordinate.longitude)
                points.append(point)
            }
            
        }
        return points
        
    }
    
    func createShape(points : [CGPoint]) -> Shape{
        let shape = Shape(points: [
//            use points
            CGPoint(x: 0,y: 0),
            CGPoint(x: 0,y: 1),
            CGPoint(x: 1,y: 1),
            CGPoint(x: 1,y: 0),
            CGPoint(x: 0,y: 0)
        ])

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


