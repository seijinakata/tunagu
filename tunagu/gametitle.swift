//
//  title.swift
//  tunagu
//
//  Created by Owner on 2/6/1398 AP.
//  Copyright © 1398 AP Owner. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit
import AVFoundation
import GameKit
let maintitle = SKSpriteNode(imageNamed: "title")
var selectplayer:AVAudioPlayer!

class gametitle: SKScene,GKGameCenterControllerDelegate {
    
    
    let url = Bundle.main.path(forResource: "select04", ofType: "mp3")
    
    override func didMove(to view: SKView) {
        
        do{
            try selectplayer = AVAudioPlayer(contentsOf: URL(fileURLWithPath: url!))
            selectplayer.prepareToPlay()
        }catch{
            print(error)
        }
        
        let startlabel = SKLabelNode(fontNamed: "Chalkduster")
        startlabel.fontSize = 35
        startlabel.zPosition = 3
        startlabel.fontColor = SKColor.black
        let rankinglabel = startlabel.copy() as! SKLabelNode
        rankinglabel.fontSize = 30
        //let delete = startlabel.copy() as! SKLabelNode
        let howtolabel = startlabel.copy() as! SKLabelNode
        
        startlabel.text = "スタート"
        startlabel.name = "start"
        rankinglabel.text = "gamecenter"
        rankinglabel.name = "gamecenter"
        howtolabel.text = "遊び方"
        howtolabel.name = "howto"
        
        //delete.text = "delete"
        //delete.name = "delete"
        //delete.position = CGPoint(x: 0,y: -50)

        startlabel.position = CGPoint(x: -108,y: 135)
        rankinglabel.position = CGPoint(x: 0,y: 20)
        howtolabel.position = CGPoint(x: 108,y: 135)

        maintitle.zPosition = 1
        self.addChild(maintitle)
        self.addChild(startlabel)
        self.addChild(rankinglabel)
        self.addChild(howtolabel)
        //self.addChild(delete)
    }
    
    func gameCenterViewControllerDidFinish(_ gameCenterViewController: GKGameCenterViewController) {
        gameCenterViewController.dismiss(animated: true, completion: nil)
    }
    
    func touchDown(atPoint pos : CGPoint) {
        let touchnodes = self.nodes(at: pos)
        for tnode in touchnodes{
            if tnode.name == "start"{
                selectplayer.play()
                if let gamescene = GameScene(fileNamed: "GameScene") {
                    // Set the scale mode to scale to fit the window
                    gamescene.scaleMode = .fill
                    // Present the scene
                    self.view?.presentScene(gamescene)
                }
            }
            if tnode.name == "gamecenter"{
                selectplayer.play()
                let vc = GKGameCenterViewController()
                vc.gameCenterDelegate = self
                vc.viewState = .leaderboards
                vc.leaderboardIdentifier = leaderboardId
                self.view?.window?.rootViewController?.present(vc, animated: true, completion: nil)
                //ランキングへの推移
                /*if let ranking = gameranking(fileNamed: "gameranking") {
                    // Set the scale mode to scale to fit the window
                    ranking.scaleMode = .fill
                    // Present the scene
                    self.view?.presentScene(ranking)
                }*/
            }
            if tnode.name == "howto"{
                selectplayer.play()
                if let howto = gamehowto(fileNamed: "gamehowto") {
                    // Set the scale mode to scale to fit the window
                    howto.scaleMode = .fill
                    // Present the scene
                    self.view?.presentScene(howto)
                }
            }
            /*if tnode.name == "delete"{
                userdefaults.removeObject(forKey: "0SCORE")
                if userdefaults.object(forKey: "0SCORE") == nil{
                    userdefaults.set(-1, forKey: "0SCORE")
                }
                userdefaults.removeObject(forKey: "1SCORE")
                if userdefaults.object(forKey: "1SCORE") == nil{
                    userdefaults.set(-1, forKey: "1SCORE")
                }
                userdefaults.removeObject(forKey: "2SCORE")
                if userdefaults.object(forKey: "2SCORE") == nil{
                    userdefaults.set(-1, forKey: "2SCORE")
                }
                
            }*/
            
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
