//
//  Bird.swift
//  FlapBirdFlap
//
//  Created by Goran Pavlovic on 4/14/18.
//  Copyright © 2018 Goran Pavlovic. All rights reserved.
//

import UIKit
import SpriteKit

class Bird: SKSpriteNode {
    
    init(frame1: SKTexture, frame2: SKTexture, frame3: SKTexture, scale: CGFloat, position: CGPoint){
        
        super.init(texture: frame1, color: .clear, size: frame1.size())
        zPosition = 10
        self.position = position
        
        physicsBody = SKPhysicsBody(texture: frame1, size: frame1.size())
        physicsBody!.contactTestBitMask = physicsBody!.collisionBitMask
        physicsBody?.isDynamic = true
        
        //player.physicsBody?.collisionBitMask = 0
        
        setScale(scale)
        
        let animation = SKAction.animate(with: [frame1, frame2, frame3, frame2], timePerFrame: 0.01)
        let runForever = SKAction.repeatForever(animation)
        
        run(runForever)
    }
    
    required init?(coder aDecoder: NSCoder) {
        //fatalError("init(coder:) has not been implemented")
        super.init(texture: nil, color: .clear, size: CGSize(width: 1, height: 1))
    }
    
}
