//
//  AppColors.swift
//  StreetDraw
//
//  Created by Roland Schmitz on 21.11.19.
//  Copyright © 2019 Roland Schmitz. All rights reserved.
//

import Foundation
import UIKit

extension Difficulty {
    func getColor() -> UIColor {
        
        let color: UIColor
        switch self {
        case .easy:
            color = .systemGreen
        case .normal:
            color = .systemOrange
        case .hard:
            color = .systemRed
        }
        return color
    }
}
