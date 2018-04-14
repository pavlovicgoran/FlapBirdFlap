//
//  Base.swift
//  FlapBirdFlap
//
//  Created by Goran Pavlovic on 4/14/18.
//  Copyright © 2018 Goran Pavlovic. All rights reserved.
//

import UIKit
import SpriteKit

class Base: SKSpriteNode {
    
    let baseTexture = "base"
    
    init(position: CGPoint, scale: CGFloat) {
        
        let texture = SKTexture(imageNamed: baseTexture)
        
        super.init(texture: texture, color: .clear, size: texture.size())
        
        self.position = position
        blendMode = .replace
        zPosition = 0
        
        physicsBody = SKPhysicsBody(texture: texture, size: texture.size())
        physicsBody?.isDynamic = false
        
        setScale(scale)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
