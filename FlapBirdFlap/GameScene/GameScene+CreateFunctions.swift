//
//  GameScene+CreateFunctions.swift
//  FlapBirdFlap
//
//  Created by Goran Pavlovic on 4/14/18.
//  Copyright © 2018 Goran Pavlovic. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

extension GameScene{
    
    func createPipes(){
        setRightXPipe()
        createLeftPipes()
        createRightPipes()
    }
    
    private func setRightXPipe(){
        pipeRightX = frame.width + 200
    }
    
    private func createLeftPipes(){
        for i in 0 ..< numberOfPipes{
            createPipe(rotation: -CGFloat.pi/2, position: CGPoint(x: pipeLeftX, y: frame.height - heightOffset - CGFloat(i)*pipeSpace), column: Column.left)
        }
    }
    
    private func createRightPipes(){
        for i in 0 ..< numberOfPipes{
            createPipe(rotation: CGFloat.pi/2, position: CGPoint(x: pipeRightX, y: frame.height - heightOffset - CGFloat(i)*pipeSpace), column: Column.right)
        }
    }
    
    private func createPipe(rotation: CGFloat, position: CGPoint, column: Column){
        let pipe = Pipe(rotation: rotation, position: position, scale: scale)
        pipe.setColumn(column: column)
        addChild(pipe)
        array.append(pipe)
    }
    
    func createBackground(){
        let position = CGPoint(x: frame.width/2, y: frame.height/2)
        let background = Background(position: position, scale: scale)
        addChild(background)
    }
    

    
    func createBase(){
        let position = CGPoint(x: frame.width/2, y: 0)
        let base = Base(position: position, scale: scale)
        addChild(base)
    }
    
    func createBird(){
        
        let startPosition = CGPoint(x: frame.width/2, y: frame.height/2)
        bird = Bird(scale: scale, position: startPosition)
        addChild(bird)
    }
    
    func createLogos(){
        tutorial = SKSpriteNode(imageNamed: "tutorial")
        tutorial.position = CGPoint(x: frame.width/2, y: frame.height/2)
        addChild(tutorial)
        
        gameOver = SKSpriteNode(imageNamed: "gameover")
        gameOver.position = CGPoint(x: frame.width/2, y: frame.height/2)
        gameOver.alpha = 0
        gameOver.zPosition = 7
        addChild(gameOver)
    }
}
