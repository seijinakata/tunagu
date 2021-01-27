//
//  gameranking.swift
//  tunagu
//
//  Created by Owner on 2/7/1398 AP.
//  Copyright © 1398 AP Owner. All rights reserved.
//

/*降順にランキングを出していたシーン
import Foundation
import SpriteKit
import GameplayKit
import AVFoundation

let rankingbase = SKSpriteNode(imageNamed: "ranking")

class gameranking: SKScene {
    
    override func didMove(to view: SKView) {
        rankingbase.zPosition = 1
        addChild(rankingbase)
        var tempscore = -1
        
        //topscore
        scoredraw(key: "0SCORE", digits: &topdigits, positionx: 160, positiony: 200, positionz: 3, numbers: &topnumbers)
        tempscore = userdefaults.integer(forKey: "0SCORE")
        if tempscore >= 0{
            for c in 0..<topdigits{
                addChild(topnumbers[c])
            }
            tempscore = -1
        }
        
        
        //middlescore
        scoredraw(key: "1SCORE", digits: &middledigits, positionx: 160, positiony: 50, positionz: 3, numbers: &middlenumbers)
        tempscore = userdefaults.integer(forKey: "1SCORE")
        if tempscore >= 0{
            for c in 0..<middledigits{
                addChild(middlenumbers[c])
            }
            tempscore = -1
        }
        
        //underscore
        scoredraw(key: "2SCORE", digits: &underdigits, positionx: 160, positiony: -100, positionz: 3, numbers: &undernumbers)
        tempscore = userdefaults.integer(forKey: "2SCORE")
        if tempscore >= 0{
            for c in 0..<underdigits{
                addChild(undernumbers[c])
            }
            tempscore = -1
        }
    }
    
    func touchDown(atPoint pos : CGPoint) {
        if let title = gametitle(fileNamed: "gametitle") {
                    // Set the scale mode to scale to fit the window
            title.scaleMode = .fill
                // Present the scene
            self.view?.presentScene(title)
        }
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered

    }
}
*/
