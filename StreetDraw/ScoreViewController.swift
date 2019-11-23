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
    @IBOutlet weak var shapeView: ShapeView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        print("ScoreViewController.viewDidLoad()")
    }

    override func viewWillAppear(_ animated: Bool) {
        print("ScoreViewController.viewWillAppear()")
        setupUserTrackingButton()
        mapView.showsUserLocation = true
            //mapView.userTrackingMode = .follow
            
            if let shapeOverlay = shapeOverlay {
                mapView.addOverlay(shapeOverlay)
                let bounds = shapeOverlay.boundingMapRect
                mapView.setVisibleMapRect(bounds.insetBy(dx: -bounds.width / 5, dy: -bounds.height / 5 ), animated: true)
                
        }
        self.shapeView.tintColor = .orange
        self.shapeView.show(shape: createShape(points: getPointOfOverlay(shapeOverlay: self.shapeOverlay)))
        
//        let radians = 180.0 / 180.0 * CGFloat.pi
//        let rotation = shapeView.transform.rotated(by: radians);
//              shapeView.transform = rotation
        
        
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        print("ScoreViewController.viewDidAppear()")
        mapView.showsUserLocation = true
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
        var point: CGPoint = CGPoint.init()
        self.shapeOverlay = shapeOverlay
        if let polyline = shapeOverlay as? MKPolyline {
            let coordinates = polyline.coordinates
            for coordinate in coordinates {
                point.x = CGFloat(coordinate.longitude)
                point.y = CGFloat(-coordinate.latitude)
                points.append(point)
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


