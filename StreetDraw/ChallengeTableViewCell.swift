//
//  ChallengeTableViewCell.swift
//  StreetDraw
//
//  Created by Roland Schmitz on 19.11.19.
//  Copyright © 2019 Roland Schmitz. All rights reserved.
//

import UIKit

class ChallengeTableViewCell: UITableViewCell {
    var chapter: Chapter?
    var challenge: Challenge?
    
    @IBOutlet weak var shapeView: ShapeView!
    @IBOutlet weak var shapeBackgroundView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var minDistanceLabel: UILabel!
    @IBOutlet weak var timeLimitLabel: UILabel!
    @IBOutlet weak var timeLimitCaption: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func prepareFor(chapter: Chapter, challenge: Challenge) {
        self.chapter = chapter
        self.challenge = challenge
        nameLabel.text = challenge.name
        shapeView.show(shape: challenge.shape)
        minDistanceLabel.text = "\(challenge.minDistance) km" 
        if let maxDuration = challenge.maxDuration {
            timeLimitLabel.text = maxDuration.description
            timeLimitCaption.alpha = 1.0
            timeLimitLabel.alpha = 1.0
        } else {
            timeLimitCaption.alpha = 0.0
            timeLimitLabel.alpha = 0.0
        }
        shapeBackgroundView.backgroundColor = challenge.difficulty.getColor()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
