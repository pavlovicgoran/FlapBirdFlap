//
//  GameScene+DeviceCompatibility.swift
//  FlapBirdFlap
//
//  Created by Goran Pavlovic on 4/14/18.
//  Copyright © 2018 Goran Pavlovic. All rights reserved.
//

import Foundation
import UIKit

extension GameScene{
    func checkDevice(){
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
