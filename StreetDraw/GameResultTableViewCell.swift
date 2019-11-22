//
//  GameResultTableViewCell.swift
//  StreetDraw
//
//  Created by Pasquale Moscillo on 21/11/2019.
//  Copyright © 2019 Roland Schmitz. All rights reserved.
//

import UIKit

class GameResultTableViewCell: UITableViewCell {

    var gameResult: GameResult?
    var chapter: Chapter?
    var challenge: Challenge?
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var accuracyLabel: UILabel!
    @IBOutlet weak var shapeBackgroundView: UIView!
    @IBOutlet weak var shapeView: ShapeView!
    @IBOutlet weak var challengeNameLabel: UILabel!
    
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
        self.chapter = gameResult.chapter
        self.challenge = gameResult.challenge
        challengeNameLabel.text = "\(gameResult.challenge.name)"
        scoreLabel.text = "\(gameResult.score)"
        accuracyLabel.text = "\((gameResult.accuracy)*100) %"
        shapeView.show(shape: gameResult.challenge.shape)
        shapeBackgroundView.backgroundColor = gameResult.challenge.difficulty.getColor()
    }
}
