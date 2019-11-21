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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shapeView.tintColor = challenge?.difficulty.getColor()
        shapeView.show(shape: challenge?.shape)
        locationManager?.delegate = self
        self.mapView.delegate = self
        checkLocationAuthorizationStatus()
        mapView.showsUserLocation = true
        
    }

    func checkLocationAuthorizationStatus() {
        print("CLLocationManager.authorizationStatus(): \(CLLocationManager.authorizationStatus().rawValue)")
        locationManager?.requestWhenInUseAuthorization()
        print("CLLocationManager.authorizationStatus(): \(CLLocationManager.authorizationStatus().rawValue)")

//      if CLLocationManager.authorizationStatus() == .authorizedAlways {
//        mapView.showsUserLocation = true
//      } else {
//        locationManager.requestWhenInUseAuthorization()
//      }
    }


    func prepareFor(chapter: Chapter, challenge: Challenge) {
        self.chapter = chapter
        self.challenge = challenge
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

