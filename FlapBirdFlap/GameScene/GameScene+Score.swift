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

extension GameScene{
    func createScore() {
        scoreLabel = SKLabelNode(fontNamed: "Optima-ExtraBlack")
        scoreLabel.fontSize = 24
        
        scoreLabel.position = CGPoint(x: frame.midX, y: frame.maxY - 60)
        scoreLabel.text = "SCORE: 0"
        scoreLabel.fontColor = UIColor.white
        scoreLabel.zPosition = 7
        
        addChild(scoreLabel)
        
        setupScoreTimer()
    }
    
    private func setupScoreTimer(){
        scoreTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateScoreTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateScoreTimer(){
        score += 1
    }
    
    func invalidateScoreTimer(){
        scoreTimer.invalidate()
    }
}
