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
import AVKit
import AVFoundation

class StartGameViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    var chapter: Chapter?
    var challenge: Challenge?
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var shapeView: ShapeView!
    @IBOutlet weak var minDistanceLabel: UILabel!
    @IBOutlet weak var timeLimitLabel: UILabel!
    @IBOutlet weak var timeLimitCaption: UILabel!
    @IBOutlet weak var minDistanceCaption: UILabel!
   
    @IBAction func playVideo(_ sender: Any) {
        guard let path = Bundle.main.path(forResource: "howToStart", ofType: "mov") else {return}
        let videoURL = URL(fileURLWithPath: path)
        let player = AVPlayer(url: videoURL)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        
        self.present(playerViewController, animated: true) {
            playerViewController.player?.play()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mapView.delegate = self
        setupUserTrackingButton()
    }

    override func viewWillAppear(_ animated: Bool) {
        appDelegate.locationManager?.delegate = self
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
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("StartGameViewController viewDidAppear")
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.startGameViewController = self
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
        appDelegate.requestLocationAuthorization()
    }

    func prepareFor(chapter: Chapter, challenge: Challenge) {
        self.chapter = chapter
        self.challenge = challenge
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "playing" {
            let overlay = getShapeOverlay()
            print("overlay is : \((overlay as! MKPolyline).points())")
            if let playGameViewController = segue.destination as? PlayGameViewController {
                playGameViewController.prepareForChallenge(chapter: chapter!, challenge: challenge!, shapeOverlay: overlay)
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


