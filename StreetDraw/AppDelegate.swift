//
//  AppDelegate.swift
//  StreetDraw
//
//  Created by Roland Schmitz on 17.11.19.
//  Copyright © 2019 Roland Schmitz. All rights reserved.
//

import UIKit
import CoreLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var streetDrawApp: StreetDrawApplication?
    var locationManager: CLLocationManager?
    var challengesViewController: ChallengesViewController?
    var startGameViewController: StartGameViewController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        print("didFinishLaunchingWithOptions: \(String(describing: launchOptions))")
        streetDrawApp = createStreetDrawApplication()
        print("CLLocationManager.authorizationStatus(): \(CLLocationManager.authorizationStatus().rawValue)")
        locationManager = CLLocationManager()
        //locationManager?.allowsBackgroundLocationUpdates = true
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    func requestLocationAuthorization() {
        print("CLLocationManager.authorizationStatus(): \(CLLocationManager.authorizationStatus().rawValue)")
        let status = CLLocationManager.authorizationStatus()
        if status == .restricted || status == .denied {
            showAlert(title: "Location Services", message: "Location services for the app are currently disabled. Please enable them in the Settings. ") {
                self.locationManager?.requestAlwaysAuthorization()
            }
        }
        else {
            locationManager?.requestAlwaysAuthorization()
        }
    }
    
    func showAlert(title: String, message: String, completion: (() -> Void)? = nil) {
        print("#### Alert: \(title): \(message) ")
//        if var topController = UIApplication.shared.keyWindow?.rootViewController {
        if var topController = UIApplication.shared.windows.last?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            topController.present(alertController, animated: true, completion: completion)
        } else {
            completion?()
        }
    }
    
}

