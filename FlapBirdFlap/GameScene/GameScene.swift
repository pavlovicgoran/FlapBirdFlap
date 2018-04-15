//
//  GameScene.swift
//  FlapBirdFlap
//
//  Created by Goran Pavlovic on 4/13/18.
//  Copyright © 2018 Goran Pavlovic. All rights reserved.
//

import SpriteKit
import GameplayKit



class GameScene: SKScene{
    
    
    var bird: Bird!
    let scale: CGFloat = 1.5
    
    let pipeLeftX:CGFloat = -200
    var pipeRightX:CGFloat = 0
    
    var heightOffset: CGFloat = 70
    
    let pipeSpace: CGFloat = 100
    
    var array = [Pipe]()
    
    var numberOfPipes = 6
    
    var scoreLabel: SKLabelNode!
    
    var scoreTimer: Timer!
    
    var pipeTimer: Timer!
    
    var popUpTime = 1.0
    
    var tutorial: SKSpriteNode!
    var gameOver: SKSpriteNode!
    
    var gameState: GameState = .showingLogo
    
    var score = 0 {
        didSet {
            scoreLabel.text = "SCORE: \(score)"
        }
    }
    
    override func didMove(to view: SKView) {
        checkDevice()
        
        createBird()
        createBase()
        
        createLogos()
        
        setupGravity()
        
        createBackground()
        
        createScore()
        createPipes()
        
    }
    
    
   
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       
        switch gameState {
        case .showingLogo:
            gameState = .playing
            
            score = 0
            
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
            
            
        case .playing:
            
            bird.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
            bird.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 20))
            
            
        case .dead:
            invalidatePipeTimer()
            let scene = SKScene(fileNamed: "GameScene")!
            let transition = SKTransition.doorsOpenHorizontal(withDuration: 1)
            self.view?.presentScene(scene, transition: transition)
        }
        
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        guard bird != nil else {
            return
        }
        
        birdFallingAnimation()
        
        if bird.position.y > frame.height{
            endGame()
        }
        
        
    }
    
    private func birdFallingAnimation(){
        let value = bird.physicsBody!.velocity.dy * 0.001
        let rotate = SKAction.rotate(toAngle: value, duration: 0.1)
        
        bird.run(rotate)
    }
    
    
    
    private func setupGravity(){
        physicsWorld.gravity = CGVector(dx: 0.0, dy: -5.0)
        physicsWorld.contactDelegate = self
    }
    

    
}
