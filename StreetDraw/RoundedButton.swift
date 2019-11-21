//
//  RoundedButton.swift
//  StreetDraw
//
//  Created by Roland Schmitz on 20.11.19.
//  Copyright © 2019 Roland Schmitz. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedButton: UIButton {

    @IBInspectable
    var cornerRadius: CGFloat = 30 {
        didSet {
            setupCorners()
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCorners()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupCorners()
    }
    
    override func prepareForInterfaceBuilder() {
        setupCorners()
    }
    
    func setupCorners() {
        layer.cornerRadius = cornerRadius
    }
}
