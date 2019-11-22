//
//  PlayGameViewController.swift
//  StreetDraw
//
//  Created by Roland Schmitz on 21.11.19.
//  Copyright © 2019 Roland Schmitz. All rights reserved.
//

import UIKit
import MapKit

class PlayGameViewController: UIViewController, MKMapViewDelegate {
    var chapter: Chapter?
    var challenge: Challenge?
    var shapeOverlay: MKOverlay?
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var stopButton: RoundedButton!
    @IBOutlet weak var resumeButton: RoundedButton!
    @IBOutlet weak var endButton: RoundedButton!
    
    var inRunningMode = true {
        didSet {
            updateButtons()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        setupUserTrackingButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        mapView.showsUserLocation = true
        //mapView.userTrackingMode = .follow
        updateButtons()
        if let shapeOverlay = shapeOverlay {
            mapView.addOverlay(shapeOverlay)
            let bounds = shapeOverlay.boundingMapRect
            mapView.setVisibleMapRect(bounds.insetBy(dx: -bounds.width / 5, dy: -bounds.height / 5 ), animated: true)

        }
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
        renderer.lineWidth = 10
        return renderer

    }
    
    func updateButtons() {
        // show only the right buttons
        UIView.animate(withDuration: 0.2) { [unowned self]  in
            self.stopButton.alpha = self.inRunningMode ? 1.0 : 0.0
            self.resumeButton.alpha = self.inRunningMode ? 0.0 : 1.0
            self.endButton.alpha = self.inRunningMode ? 0.0 : 1.0
        }
    }
    
    @IBAction func stopButtonTouched(_ sender: RoundedButton) {
        inRunningMode = false
    }
    
    @IBAction func resumeButtonTouched(_ sender: RoundedButton) {
        inRunningMode = true
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    func prepareForChallenge(chapter: Chapter?, challenge: Challenge?, shapeOverlay: MKOverlay) {
        self.chapter = chapter
        self.challenge = challenge
        self.shapeOverlay = shapeOverlay
    }
}
