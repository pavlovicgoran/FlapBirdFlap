//
//  GameScene.swift
//  FlapBirdFlap
//
//  Created by Goran Pavlovic on 4/13/18.
//  Copyright © 2018 Goran Pavlovic. All rights reserved.
//

import SpriteKit
import GameplayKit



class GameScene: SKScene, SKPhysicsContactDelegate {
    
    
    var bird: Bird!
    let scale: CGFloat = 1.5
    
    let pipeLeftX:CGFloat = -200
    var pipeRightX:CGFloat = 0
    
    var heightOffset: CGFloat = 70
    
    let pipeSpace: CGFloat = 100
    
    var array = [Pipe]()
    
    var numberOfPipes = 6
    
    var scoreLabel: SKLabelNode!
    
    var score = 0 {
        didSet {
            scoreLabel.text = "SCORE: \(score)"
        }
    }
    
    override func didMove(to view: SKView) {
        checkDevice()
        
        createBird()
        createBase()
        
        setupGravity()
        
        createBackground()
        
        createScore()
        
        createPipes()
        
        array[5].movePipe(middleOfScreen: frame.midX)
    }
    
    
   
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       
        
        bird.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
        bird.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 11))
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        let value = bird.physicsBody!.velocity.dy * 0.001
        let rotate = SKAction.rotate(toAngle: value, duration: 0.1)
        
        bird.run(rotate)
    }
    
    private func setupGravity(){
        physicsWorld.gravity = CGVector(dx: 0.0, dy: -5.0)
        physicsWorld.contactDelegate = self
    }
    
    private func checkDevice(){
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
            case 1136:
                print("iPhone 5 or 5S or 5C")
                heightOffset = 50
                numberOfPipes = 4
            case 1334:
                print("iPhone 6/6S/7/8")
                heightOffset = 50
                numberOfPipes = 5
            case 1920, 2208:
                print("iPhone 6+/6S+/7+/8+")
                heightOffset = 50
                numberOfPipes = 6
            case 2436:
                print("iPhone X")
                numberOfPipes = 7
                heightOffset = 70
            default:
                print("unknown")
                heightOffset = 50
                numberOfPipes = 4
            }
        }

    }
    

    
    
}
