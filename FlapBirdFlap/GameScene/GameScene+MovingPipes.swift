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
        
        pipeTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(choosePipeToMove), userInfo: nil, repeats: false)
        
    }
    
    func invalidatePipeTimer(){
        pipeTimer.invalidate()
    }
    
    @objc func choosePipeToMove(){
        
        //guard bird != nil else {
           // return
        //}
        
        popUpTime *= 0.99
        
        let index = GKRandomSource.sharedRandom().nextInt(upperBound: array.count)
        
        array[index].movePipe(middleOfScreen: frame.midX)
        
        Pipe.animationDuration *= 0.98
        
        let minDelay = popUpTime / 2
        let maxDelay = popUpTime * 2
        
        let delay = RandomDouble(min: minDelay, max: maxDelay)
        
        pipeTimer.invalidate()
        pipeTimer = Timer.scheduledTimer(timeInterval: delay + 1.5 * Pipe.animationDuration, target: self, selector: #selector(choosePipeToMove), userInfo: nil, repeats: false)
        
    }
}
