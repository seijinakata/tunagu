//
//  init.swift
//  tunagu
//
//  Created by Owner on 2/7/1398 AP.
//  Copyright © 1398 AP Owner. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit
import AVFoundation

class gameinit: SKScene {
    
    override func didMove(to view: SKView) {
        
        score = 0
        scoredigits = 1
        
        topdigits = 1
        
        time = 50
        timedigits = 1
        passedtime = 1
        passedtimecounter = 0

        //top 0 under 2
        /*for i in 0...2{
            let num = String(format: "%d", i)
            let score = num + "SCORE"
            if(userdefaults.object(forKey: score) == nil){
                userdefaults.set(-1, forKey: score)
                userdefaults.synchronize()
            }
        }*/
        //numberinit
        //numberpicture 0から9の10個
        for i in 1..<11{
            let numberdemo:SKSpriteNode
            let numberrect = CGRect(x: 40*(i-1), y: 0, width: 40, height: 85)
            numberdemo = imagetonode(imagename: "number.png", triming: numberrect)
            //point
            numberdemo.zPosition = 3
            numberdemo.position.x = 0
            numberdemo.position.y = 0
            numbernode.append(numberdemo)
        }
        //scoreinit
        for _ in 0..<scoredigits{
            let numbernodecopy = numbernode[0].copy() as! SKSpriteNode
            scorenumbers.append(numbernodecopy)
        }
        
        //timeinit
        for _ in 0..<timedigits{
            let numbernodecopy = numbernode[0].copy() as! SKSpriteNode
            timenumbers.append(numbernodecopy)
        }
        //pieceinit
        //0...5blue
        for i in 0...1{
            for j in 0...2{
                let cgrect = CGRect(x: 77*j, y: 77*i, width: 77, height: 77)
                let pieceblue = imagetonode(imagename:"fieldblue",triming:cgrect)
                piecepattern.append(pieceblue)
            }
        }
        //6...11yellow
        for i in 0...1{
            for j in 0...2{
                let cgrect = CGRect(x: 77*j, y: 77*i, width: 77, height: 77)
                let pieceblue = imagetonode(imagename:"fieldyellow",triming:cgrect)
                piecepattern.append(pieceblue)
            }
        }
        //12...15red
        for i in 0...1{
            for j in 0...1{
                let cgrect = CGRect(x: 77*j, y: 77*i, width: 77, height: 77)
                let pieceblue = imagetonode(imagename:"fieldred",triming:cgrect)
                piecepattern.append(pieceblue)
            }
        }
        //16none
        piecepattern.append(none)
        
        for i in 0...48{
            //pattern合わせる
            let temp = 16
            let piecetemp = piecepattern[temp].copy() as! SKSpriteNode
            let scoretemp = none.copy() as! SKSpriteNode
            pieces.append(piece(pattern: 6, piecenode: piecetemp,number:temp,scorecapsule: 0,scorecapsulenode: scoretemp))
            pieces[i].piecenode.zPosition = 2
            pieces[i].piecenode.position.x = CGFloat((-152-76) + (76*(i%7)))
            pieces[i].piecenode.position.y = CGFloat((62+76) - (76*(i/7)))
            let number = String(format: "%02d", i)
            pieces[i].piecenode.name = number
            
            pieces[i].scorecapsulenode.zPosition = 3
            pieces[i].scorecapsulenode.position.x = CGFloat((-152-76) + (76*(i%7)))
            pieces[i].scorecapsulenode.position.y = CGFloat((62+76) - (76*(i/7)))
            pieces[i].scorecapsulenode.name = number
        }

        if let title = gametitle(fileNamed: "gametitle") {
            // Set the scale mode to scale to fit the window
            title.scaleMode = .fill
            // Present the scene
            self.view?.presentScene(title)
        }
    }
    
    func touchDown(atPoint pos : CGPoint) {
        
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


