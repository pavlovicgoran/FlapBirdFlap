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
    var highScoreLabel: SKLabelNode!
    var highScoreHolder: SKLabelNode!
    
    var scoreTimer: Timer!
    
    var pipeTimer: Timer!
    
    var popUpTime = 1.0
    
    var tutorial: SKSpriteNode!
    var gameOver: SKSpriteNode!
    
    var gameState: GameState = .showingLogo
    
    var highScore = 0{
        didSet{
            highScoreLabel.text = "\(highScore)"
        }
    }
    
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
        createHighscore()
        //createScore()
        createPipes()
        
    }
    
    
   
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       
        switch gameState {
        case .showingLogo:
            gameState = .playing
            
            scoreFadingOut()
            
        case .playing:
            
            bird.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
            bird.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 20))
            playSound(sound: .flap)
            
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
