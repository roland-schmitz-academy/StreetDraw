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
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var shapeOverlay: MKOverlay?
    var timer: Timer?
    var game: Game?
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var stopButton: RoundedButton!
    @IBOutlet weak var resumeButton: RoundedButton!
    @IBOutlet weak var endButton: RoundedButton!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    var inRunningMode = true {
        didSet {
            updateButtons()
            updateGameState()
        }
    }
    
    func updateGameState() {
        // todo later: finsd out if user is still moving and automatically pause or resume the game
        // for now we pause if user taps on Stop and we continue if user taps on Resume
        if inRunningMode {
            game?.continue()
        } else {
            game?.pause()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        setupUserTrackingButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if game?.start(playGameViewController: self) ?? false {
            mapView.showsUserLocation = true
            updateButtons()
            if let shapeOverlay = shapeOverlay {
                mapView.addOverlay(shapeOverlay)
                let bounds = shapeOverlay.boundingMapRect
                mapView.setVisibleMapRect(bounds.insetBy(dx: -bounds.width / 5, dy: -bounds.height / 5 ), animated: true)
                
            }
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [unowned self] timer in
                DispatchQueue.main.async {
                    self.updateDynamicLabels()
                }
            }
        }
    }
    
    
    
    func updateDynamicLabels() {
        timeLabel?.text = timeToString(from: game?.stopwatch.activeDuration ?? 0.0)
        distanceLabel?.text = formatDistance(distance: game?.track.distance)

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        // todo stop timer
        timer?.invalidate()
        timer = nil
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
            renderer.strokeColor = .systemGray // game?.challenge?.difficulty.getColor()
            renderer.alpha = 0.4
        } else {
            renderer.strokeColor = .systemBlue
            renderer.alpha = 0.8
        }
        renderer.lineWidth = 8
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
    
    func addTrackOverlay(overlay: MKOverlay) {
        mapView?.addOverlay(overlay)
    }
    
    @IBAction func stopButtonTouched(_ sender: RoundedButton) {
        inRunningMode = false
    }
    
    @IBAction func resumeButtonTouched(_ sender: RoundedButton) {
        inRunningMode = true
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ending" {
            if game?.end() ?? false {
                if let scoreViewController = segue.destination as? ScoreViewController {
                    scoreViewController.prepareForGameResult(gameResult: game!.gameResult)
                    scoreViewController.prepareOverlays(shapeOverlay: shapeOverlay, trackOverlay: game!.track.createOverlay())
                }
            }
        }
    }
    
    func prepareForChallenge(chapter: Chapter, challenge: Challenge, shapeOverlay: MKOverlay) {
        game = Game(chapter: chapter, challenge: challenge)
        self.shapeOverlay = shapeOverlay
        if let polyline = shapeOverlay as? MKPolyline {
            let coordinates = polyline.coordinates
            for coordinate in coordinates {
                print("latitude: \(coordinate.latitude) longitude: \(coordinate.longitude)")
            }
        }
    }
}
