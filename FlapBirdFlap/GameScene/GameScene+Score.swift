//
//  GameScene+Score.swift
//  FlapBirdFlap
//
//  Created by Goran Pavlovic on 4/14/18.
//  Copyright © 2018 Goran Pavlovic. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit
// MARK: Score
extension GameScene{
    func createScore() {
        scoreLabel = SKLabelNode(fontNamed: "Optima-ExtraBlack")
        scoreLabel.fontSize = 24
        
        scoreLabel.position = CGPoint(x: frame.midX, y: frame.maxY - 60)
        scoreLabel.text = "SCORE: 0"
        scoreLabel.fontColor = UIColor.white
        scoreLabel.zPosition = 7
        
        addChild(scoreLabel)
        
        
    }
    
    func setupScoreTimer(){
        scoreTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateScoreTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateScoreTimer(){
        score += 1
    }
    
    func invalidateScoreTimer(){
        scoreTimer.invalidate()
    }
}
// MARK: Highscore

extension GameScene{
    func createHighscore(){
        highScoreLabel = SKLabelNode(fontNamed: "Optima-ExtraBlack")
        highScoreLabel.fontSize = 100
        
        highScoreLabel.position = CGPoint(x: frame.midX, y: frame.maxY - 160)
        highScoreLabel.text = "\(highScore)"
        highScoreLabel.fontColor = UIColor.white
        highScoreLabel.zPosition = 7
        
        highScoreHolder = SKLabelNode(fontNamed: "Optima-ExtraBlack")
        highScoreHolder.fontSize = 20
        highScoreHolder.position = CGPoint(x: highScoreLabel.position.x, y: highScoreLabel.position.y + 80)
        highScoreHolder.text = "YOUR HIGHSCORE:"
        highScoreHolder.fontColor = UIColor.white
        highScoreHolder.zPosition = 7
        
        restoreHighscore()
        
        addChild(highScoreHolder)
        
        addChild(highScoreLabel)
    }
    
    func scoreFadingOut(){
        createScore()
        let fadeOut = SKAction.fadeOut(withDuration: 0.5)
        let remove = SKAction.removeFromParent()
        let wait = SKAction.wait(forDuration: 0.5)
        
        let activatePlayer = SKAction.run(){[unowned self] in
            
            self.bird.physicsBody?.isDynamic = true
            self.setupScoreTimer()
            self.startMovingPipes()
            
        }
        
        let sequence = SKAction.sequence([fadeOut, wait, activatePlayer, remove])
        tutorial.run(sequence)
        highScoreLabel.run(fadeOut)
        highScoreHolder.run(fadeOut)
    }
    
    func showHighScore(){
        highScoreHolder.alpha = 1
        highScoreLabel.alpha = 1
    }
    
    func updateHighscore(){
        if score > highScore{
            highScore = score
        }
    }
}


