//
//  GameResultTableViewCell.swift
//  StreetDraw
//
//  Created by Pasquale Moscillo on 21/11/2019.
//  Copyright © 2019 Roland Schmitz. All rights reserved.
//

import UIKit

class GameResultTableViewCell: UITableViewCell {

    @IBOutlet weak var scoreLabel: UILabel!
    var gameResult: GameResult?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func prepareFor(gameResult: GameResult) {
        self.gameResult = gameResult
        scoreLabel.text = "\(gameResult.score)"
    }
}
