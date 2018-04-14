//
//  Pipe.swift
//  FlapBirdFlap
//
//  Created by Goran Pavlovic on 4/14/18.
//  Copyright © 2018 Goran Pavlovic. All rights reserved.
//

import UIKit
import SpriteKit

class Pipe: SKSpriteNode {

    let greenPipe = "pipe-green"
    let redPipe = "pipe-red"
    
    init(rotation: CGFloat, position: CGPoint, scale: CGFloat) {
        let pipeTexture = SKTexture(imageNamed: greenPipe)
        
        super.init(texture: pipeTexture, color: .clear, size: pipeTexture.size())
        
        physicsBody = SKPhysicsBody(texture: texture!, size: texture!.size())
        physicsBody?.isDynamic = false
        
        setScale(scale)
        self.position = position
        zRotation = rotation
        
        zPosition = 5
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
