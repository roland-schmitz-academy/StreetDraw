//
//  DemoViewController.swift
//  StreetDraw
//
//  Created by Luigi Cerrato on 20/11/2019.
//  Copyright © 2019 Roland Schmitz. All rights reserved.
//

import UIKit

class DemoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let width: CGFloat = 240.0
        let height:CGFloat = 160.0
        let shapeView = ShapeView(frame: CGRect(x: self.view.frame.size.width/2 - width/2, y: self.view.frame.size.height/2  - height/2, width: width, height: height))
        
        self.view.addSubview(shapeView)
        
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
