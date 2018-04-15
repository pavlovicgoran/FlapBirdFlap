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
            endGame()
        }
    }
    
    func endGame(){
        invalidateScoreTimer()
        explode()
        bird.removeFromParent()
        bird = nil
        gameOver.alpha = 1
        gameState = .dead
        playSound(sound: .hit)
        updateHighscore()
        showHighScore()
        saveHighscore()
    }
    
    func explode(){
        if let explosion = SKEmitterNode(fileNamed: "Explosion") {
            explosion.position = bird.position
            addChild(explosion)
        }
    }
    
}
