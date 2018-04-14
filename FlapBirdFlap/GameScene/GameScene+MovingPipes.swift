//
//  GameScene+MovingPipes.swift
//  FlapBirdFlap
//
//  Created by Goran Pavlovic on 4/14/18.
//  Copyright © 2018 Goran Pavlovic. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit
import GameplayKit

extension GameScene{
    
    func startMovingPipes(){
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {[unowned self] in
            self.choosePipeToMove()
        })
        
    }
    
    private func choosePipeToMove(){
        
        guard bird != nil else {
            return
        }
        
        popUpTime *= 0.99
        
        let index = GKRandomSource.sharedRandom().nextInt(upperBound: array.count)
        
        array[index].movePipe(middleOfScreen: frame.midX)
        
        Pipe.animationDuration *= 0.98
        
        let minDelay = popUpTime / 2
        let maxDelay = popUpTime * 2
        
        let delay = RandomDouble(min: minDelay, max: maxDelay)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5*Pipe.animationDuration + delay) {[unowned self] in
            self.choosePipeToMove()
        }
        
    }
}
