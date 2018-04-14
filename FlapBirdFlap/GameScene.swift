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
    
    var array = [SKSpriteNode]()
    
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
        
        array[0].position.x = 75
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
    
    private func createPipes(){
        setRightXPipe()
        createLeftPipes()
        createRightPipes()
    }
    
    private func setRightXPipe(){
        pipeRightX = frame.width + 200
    }
    
    private func createLeftPipes(){
        for i in 0 ..< numberOfPipes{
            createPipe(rotation: -CGFloat.pi/2, position: CGPoint(x: pipeLeftX, y: frame.height - heightOffset - CGFloat(i)*pipeSpace))
        }
    }
    
    private func createRightPipes(){
        for i in 0 ..< numberOfPipes{
            createPipe(rotation: CGFloat.pi/2, position: CGPoint(x: pipeRightX, y: frame.height - heightOffset - CGFloat(i)*pipeSpace))
        }
    }
    
    private func createPipe(rotation: CGFloat, position: CGPoint){
        let pipe = Pipe(rotation: rotation, position: position, scale: scale)
        addChild(pipe)
        array.append(pipe)
    }
    
    private func createBackground(){
        let position = CGPoint(x: frame.width/2, y: frame.height/2)
        let background = Background(position: position, scale: scale)
        addChild(background)
    }
    
    func createScore() {
        scoreLabel = SKLabelNode(fontNamed: "Optima-ExtraBlack")
        scoreLabel.fontSize = 24
        
        scoreLabel.position = CGPoint(x: frame.midX, y: frame.maxY - 60)
        scoreLabel.text = "SCORE: 0"
        scoreLabel.fontColor = UIColor.white
        scoreLabel.zPosition = 7
        
        addChild(scoreLabel)
    }
    
    private func createBase(){
        let position = CGPoint(x: frame.width/2, y: 0)
        let base = Base(position: position, scale: scale)
        addChild(base)
    }
    
    private func createBird(){
        
        let startPosition = CGPoint(x: frame.width/2, y: frame.height/2)
        bird = Bird(scale: scale, position: startPosition)
        addChild(bird)
    }
    
    
}
