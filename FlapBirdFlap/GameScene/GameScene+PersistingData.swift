//
//  GameScene+PersistingData.swift
//  FlapBirdFlap
//
//  Created by Goran Pavlovic on 4/15/18.
//  Copyright © 2018 Goran Pavlovic. All rights reserved.
//

import Foundation

extension GameScene{
    
    var highScoreKey: String{
        return "Highscore"
    }
    
    func saveHighscore(){
        let defaults = UserDefaults.standard
        defaults.set(highScore, forKey: highScoreKey)
    }
    
    func restoreHighscore(){
        let defaults = UserDefaults.standard
        let score = defaults.integer(forKey: highScoreKey)
        highScore = score
    }
    
}
