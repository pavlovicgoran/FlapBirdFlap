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
    
    private let yellowBirdDown = "yellowbird-downflap"
    private let yellowBirdMid = "yellowbird-midflap"
    private let yellowBirdUp = "yellowbird-upflap"
    
    private let blueBirdDown = "bluebird-downflap"
    private let blueBirdMid = "bluebird-midflap"
    private let blueBirdUp = "bluebird-upflap"
    
    private let redBirdDown = "redbird-downflap"
    private let redBirdMid = "redbird-midflap"
    private let redBirdUp = "redbird-upflap"
    
    init(scale: CGFloat, position: CGPoint){
        let playerTexture = SKTexture(imageNamed: redBirdDown)
        let frame2 = SKTexture(imageNamed: redBirdMid)
        let frame3 = SKTexture(imageNamed: redBirdUp)
        
        super.init(texture: playerTexture, color: .clear, size: playerTexture.size())
        zPosition = 10
        self.position = position
        
        physicsBody = SKPhysicsBody(texture: texture!, size: texture!.size())
        physicsBody!.contactTestBitMask = physicsBody!.collisionBitMask
        physicsBody?.isDynamic = false
        
        //player.physicsBody?.collisionBitMask = 0
        
        setScale(scale)
        
        let animation = SKAction.animate(with: [playerTexture, frame2, frame3, frame2], timePerFrame: 0.01)
        let runForever = SKAction.repeatForever(animation)
        
        run(runForever)
    }
    
    required init?(coder aDecoder: NSCoder) {
        //fatalError("init(coder:) has not been implemented")
        super.init(texture: nil, color: .clear, size: CGSize(width: 1, height: 1))
    }
    
}
