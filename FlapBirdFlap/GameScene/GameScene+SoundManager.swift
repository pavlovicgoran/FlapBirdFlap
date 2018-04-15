//
//  GameScene+SoundManager.swift
//  FlapBirdFlap
//
//  Created by Goran Pavlovic on 4/15/18.
//  Copyright © 2018 Goran Pavlovic. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

enum SoundType: String{
    case hit = "hit.wav"
    case flap = "wing.wav"
}

extension GameScene{
    
    func playSound(sound: SoundType){
        let soundTrack = SKAction.playSoundFileNamed(sound.rawValue, waitForCompletion: false)
        run(soundTrack)
    }
}
