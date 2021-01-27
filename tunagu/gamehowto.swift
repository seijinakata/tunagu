//
//  howto.swift
//  tunagu
//
//  Created by Owner on 2/17/1398 AP.
//  Copyright © 1398 AP Owner. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit
import AVFoundation

let howtobase = SKSpriteNode(imageNamed: "rule")
let fieldexpression = SKSpriteNode(imageNamed: "expression")
let capsule = SKSpriteNode(imageNamed: "scorecapsule")

class gamehowto: SKScene {
    
    override func didMove(to view: SKView) {
        
        howtobase.zPosition = 1
        fieldexpression.zPosition = 2
        capsule.zPosition = 3
        fieldexpression.position = CGPoint(x: 0,y: 90)
        capsule.position = CGPoint(x: 0,y: 90)
        addChild(howtobase)
        addChild(fieldexpression)
        addChild(capsule)
        let howto = SKLabelNode()
        howto.fontSize = 35
        howto.zPosition = 3
        howto.fontColor = SKColor.black
        
        let howto1 = howto.copy() as! SKLabelNode
        let howto2 = howto.copy() as! SKLabelNode
        let howto3 = howto.copy() as! SKLabelNode
        let howto4 = howto.copy() as! SKLabelNode
        let howto5 = howto.copy() as! SKLabelNode
        let howto6 = howto.copy() as! SKLabelNode
        let howto7 = howto.copy() as! SKLabelNode
        let howto8 = howto.copy() as! SKLabelNode
        howto1.text = "線をつなげよう"
        howto2.text = "色で回転が違う"
        howto3.text = "スコアカプセルも含め"
        howto4.text = "多く線をつなげると"
        howto5.text = "より点数アップ"
        howto6.text = "タイム０で"
        howto7.text = "ゲームオーバー"
        howto8.text = "音楽：魔王魂他"

        howto1.position = CGPoint(x: 0,y: 200)
        howto2.position = CGPoint(x: 0,y: 150)
        howto3.position = CGPoint(x: 0,y: 0)
        howto4.position = CGPoint(x: 0,y: -50)
        howto5.position = CGPoint(x: 0,y: -100)
        howto6.position = CGPoint(x: 0,y: -150)
        howto7.position = CGPoint(x: 0,y: -200)
        howto8.position = CGPoint(x: 0,y: -250)

        addChild(howto1)
        addChild(howto2)
        addChild(howto3)
        addChild(howto4)
        addChild(howto5)
        addChild(howto6)
        addChild(howto7)
        addChild(howto8)
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
