//
//  AchievementsViewController.swift
//  StreetDraw
//
//  Created by Roland Schmitz on 17.11.19.
//  Copyright © 2019 Roland Schmitz. All rights reserved.
//

import UIKit

class AchievementsViewController: UIViewController, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: // Highscores
            return streetDrawApp?.achievements.results.count ?? 0
        case 1: // Medals todo
            return 0 // todo
        default:
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section
        let row = indexPath.row
        switch section {
        case 0: // Highscores
            let cell = tableView.dequeueReusableCell(withIdentifier: "GameResult", for: indexPath)
            if let gameResultCell = cell as? GameResultTableViewCell,let gameResult = streetDrawApp?.achievements.results[row] {
                gameResultCell.prepareFor(gameResult: gameResult)
            }
            return cell
        default:
            return UITableViewCell()
        }
    }

    @IBOutlet weak var scoresAndAccuracyTableView: UITableView!
    
    var streetDrawApp: StreetDrawApplication? {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.streetDrawApp
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Achievements")
        scoresAndAccuracyTableView.dataSource = self
        for gameResult in streetDrawApp?.achievements.results ?? [] {
            print("gameResult: \(gameResult.challenge.name) \(gameResult.score) \(gameResult.accuracy)")
        }
        print("AchievementsViewController.viewDidLoad()")
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        print("numberOfSections() ?")
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "HIGHSCORES"
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
