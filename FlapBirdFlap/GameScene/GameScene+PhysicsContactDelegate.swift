//
//  GameScene+PhysicsContactDelegate.swift
//  FlapBirdFlap
//
//  Created by Goran Pavlovic on 4/14/18.
//  Copyright © 2018 Goran Pavlovic. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

extension GameScene: SKPhysicsContactDelegate{
    
    func didBegin(_ contact: SKPhysicsContact) {
        if contact.bodyA.node == bird || contact.bodyB.node == bird{
            invalidateScoreTimer()
            invalidatePipeTimer()
            bird.removeFromParent()
            bird = nil
            gameOver.alpha = 1
            gameState = .dead
        }
    }
    
}
