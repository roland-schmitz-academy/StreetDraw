//
//  ScoreViewController.swift
//  StreetDraw
//
//  Created by Roland Schmitz on 17.11.19.
//  Copyright © 2019 Roland Schmitz. All rights reserved.
//

import UIKit
import MapKit

class ScoreViewController: UIViewController {
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
