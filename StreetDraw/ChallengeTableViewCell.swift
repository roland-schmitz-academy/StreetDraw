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
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func prepareFor(chapter: Chapter, challenge: Challenge) {
        self.chapter = chapter
        self.challenge = challenge
        nameLabel.text = challenge.name
        shapeView.show(shape: challenge.shape)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
