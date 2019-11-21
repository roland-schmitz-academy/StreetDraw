//
//  StartGameViewController.swift
//  StreetDraw
//
//  Created by Roland Schmitz on 17.11.19.
//  Copyright © 2019 Roland Schmitz. All rights reserved.
//

import UIKit

class StartGameViewController: UILoggingViewController {

    var chapter: Chapter?
    var challenge: Challenge?
    
    @IBOutlet weak var shapeView: ShapeView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("StartGameViewController.viewDidLoad()")

        shapeView.tintColor = challenge?.difficulty.getColor()
        shapeView.show(shape: challenge?.shape)

        // Do any additional setup after loading the view.
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

