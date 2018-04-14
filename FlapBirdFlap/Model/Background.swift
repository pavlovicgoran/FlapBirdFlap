//
//  Background.swift
//  FlapBirdFlap
//
//  Created by Goran Pavlovic on 4/14/18.
//  Copyright © 2018 Goran Pavlovic. All rights reserved.
//

import UIKit
import SpriteKit

class Background: SKSpriteNode {

    let day = "background-day"
    let night = "background-night"
    
    init(position: CGPoint, scale: CGFloat) {
        let texture = SKTexture(imageNamed: night)
        super.init(texture: texture, color: .clear, size: texture.size())
        
        self.position = position
        blendMode = .replace
        zPosition = -1
        setScale(scale)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
