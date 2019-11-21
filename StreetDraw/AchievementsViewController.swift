//
//  AchievementsViewController.swift
//  StreetDraw
//
//  Created by Roland Schmitz on 17.11.19.
//  Copyright © 2019 Roland Schmitz. All rights reserved.
//

import UIKit

class AchievementsViewController: UILoggingViewController {
    @IBOutlet weak var scoresAndAccuracyTableView: UITableView!
    
    var streetDrawApp: StreetDrawApplication? {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.streetDrawApp
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        for achievement in streetDrawApp?.achievements.results {
//            
//        }
        print("AchievementsViewController.viewDidLoad()")
        // Do any additional setup after loading the view.
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
