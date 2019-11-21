//
//  ChallengesViewController.swift
//  StreetDraw
//
//  Created by Roland Schmitz on 17.11.19.
//  Copyright © 2019 Roland Schmitz. All rights reserved.
//

import UIKit

class ChallengesViewController: UILoggingViewController, UITableViewDataSource {
    
    @IBOutlet weak var chaptersAndChallengesTableView: UITableView!
    
    var streetDrawApp: StreetDrawApplication? {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.streetDrawApp
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chaptersAndChallengesTableView.dataSource = self
        print("ChallengesViewController.viewDidLoad()")
        print("streetDrawApp: \(String(describing: streetDrawApp?.chapters))")
        
        
        
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("numberOfRowsInSection \(section) ?")
        return streetDrawApp?.chapters[section].challenges.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("cellForRowAt \(indexPath) ?")
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChallengeCell", for: indexPath)
        if let challengeCell = cell as? ChallengeTableViewCell {
            let section = indexPath.section
            let row = indexPath.row
            if let chapter = streetDrawApp?.chapters[section] {
                let challenge = chapter.challenges[row]
                challengeCell.prepareFor(chapter: chapter, challenge: challenge)
            }
        }
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        print("numberOfSections() ?")
        return streetDrawApp?.chapters.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        streetDrawApp?.chapters[section].name
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
