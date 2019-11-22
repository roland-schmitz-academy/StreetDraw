//
//  PlayGameViewController.swift
//  StreetDraw
//
//  Created by Roland Schmitz on 21.11.19.
//  Copyright © 2019 Roland Schmitz. All rights reserved.
//

import UIKit
import MapKit

class PlayGameViewController: UIViewController {
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
        //mapView.
        setupUserTrackingButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        updateButtons()
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
    
}
