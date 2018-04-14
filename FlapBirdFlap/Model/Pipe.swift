//
//  Pipe.swift
//  FlapBirdFlap
//
//  Created by Goran Pavlovic on 4/14/18.
//  Copyright © 2018 Goran Pavlovic. All rights reserved.
//

import UIKit
import SpriteKit

enum Column{
    case left
    case right
}

class Pipe: SKSpriteNode {

    let greenPipe = "pipe-green"
    let redPipe = "pipe-red"
    
    var column: Column?
    
    static var animationDuration: TimeInterval = 1.2
    
    init(rotation: CGFloat, position: CGPoint, scale: CGFloat) {
        let pipeTexture = SKTexture(imageNamed: greenPipe)
        
        super.init(texture: pipeTexture, color: .clear, size: pipeTexture.size())
        
        
        physicsBody = SKPhysicsBody(texture: texture!, size: texture!.size())
        physicsBody?.isDynamic = false
        
        setScale(scale)
        self.position = position
        zRotation = rotation
        
        zPosition = 5
        
    }
    
    func setColumn(column: Column){
        self.column = column
    }
    
    func movePipe(middleOfScreen: CGFloat){
        
        var xcoordinate:CGFloat = 0
        
        if column == Column.left{
            
            xcoordinate = middleOfScreen * 0.3
            
        }else if column == Column.right{
            
            xcoordinate = middleOfScreen * 1.8
            
        }
        
        
        let moveForward = SKAction.moveTo(x: xcoordinate, duration: Pipe.animationDuration)
        let moveBackward = SKAction.moveTo(x: position.x, duration: Pipe.animationDuration)
        
        let sequence = SKAction.sequence([moveForward, moveBackward])
        
        run(sequence)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
