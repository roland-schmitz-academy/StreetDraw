//
//  StartGameViewController.swift
//  StreetDraw
//
//  Created by Roland Schmitz on 17.11.19.
//  Copyright © 2019 Roland Schmitz. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class StartGameViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    var chapter: Chapter?
    var challenge: Challenge?
    let locationManager = (UIApplication.shared.delegate as? AppDelegate)?.locationManager

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var shapeView: ShapeView!
    @IBOutlet weak var minDistanceLabel: UILabel!
    @IBOutlet weak var timeLimitLabel: UILabel!
    @IBOutlet weak var timeLimitCaption: UILabel!
    @IBOutlet weak var minDistanceCaption: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager?.delegate = self
        self.mapView.delegate = self
        setupUserTrackingButton()
    }

    override func viewWillAppear(_ animated: Bool) {
        updateValues()
    }

    func updateValues() {
        shapeView.tintColor = challenge?.difficulty.getColor()
        shapeView.show(shape: challenge?.shape)
        minDistanceLabel.text = "\(challenge!.minDistance) km"
        if let maxDuration = challenge?.maxDuration {
            timeLimitLabel.text = timeToString(from: maxDuration)
            timeLimitCaption.alpha = 1
        } else {
            timeLimitLabel.text = ""
            timeLimitCaption.alpha = 0
        }
//        timeLimitLabel.text = timeToString(from: <#T##TimeInterval#>)
//        timeLimitLabel.text = "\(timeToString(from: challenge!.maxDuration))"
//        timeLimitLabel.text = !(challenge!.maxDuration!)? (timeToString(from: challenge!.maxDuration!)) : " "
        
        
        // todo change distance and timeLimit
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("StartGameViewController viewDidAppear")
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.startGameViewController = self
    }
    
    var askedForLocationAccess = false
    
    func checkLocationAuthorizationStatus() {
        guard !askedForLocationAccess else { return }
        print("CLLocationManager.authorizationStatus(): \(CLLocationManager.authorizationStatus().rawValue)")
        locationManager?.requestAlwaysAuthorization()
        print("CLLocationManager.authorizationStatus(): \(CLLocationManager.authorizationStatus().rawValue)")

//      if CLLocationManager.authorizationStatus() == .authorizedAlways {
//        mapView.showsUserLocation = true
//      } else {
//        locationManager.requestWhenInUseAuthorization()
//      }
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

    func mapViewWillStartLocatingUser(_ mapView: MKMapView) {
        checkLocationAuthorizationStatus()
    }

    func prepareFor(chapter: Chapter, challenge: Challenge) {
        self.chapter = chapter
        self.challenge = challenge
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "playing" {
            checkLocationAuthorizationStatus()
        
            let overlay = getShapeOverlay()
            print("overlay is : \((overlay as! MKPolyline).points())")
            if let playGameViewController = segue.destination as? PlayGameViewController {
                playGameViewController.prepareForChallenge(chapter: chapter, challenge: challenge, shapeOverlay: overlay)
            }
            if (segue.destination as? PlayGameViewController) != nil {
                
            }
        }
    }

    
    func getShapeOverlay() -> MKOverlay {
        let points = shapeView.getDrawingPoints()
        let geoPoints = convertToGeoPoints(points: points, toCoordinateFrom: shapeView)
        print("geoPoints is : \(geoPoints)")
        let polyline = MKPolyline(coordinates: geoPoints, count: geoPoints.count)
        return polyline
        
    }
    func convertToGeoPoints(points: [CGPoint], toCoordinateFrom view : UIView) -> [CLLocationCoordinate2D] {
        
        var coordinates: [CLLocationCoordinate2D] = []
        
        for point in points {
            let coordinate = mapView.convert(point, toCoordinateFrom: view)
            print("Point is Geolocated : \(coordinate)")
            coordinates += [coordinate]
        }
        return coordinates
    }

}


