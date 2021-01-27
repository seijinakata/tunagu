//
//  GameViewController.swift
//  tunagu
//
//  Created by Owner on 12/27/1397 AP.
//  Copyright © 1397 AP Owner. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let gameinit = gameinit(fileNamed: "gameinit") {
                // Set the scale mode to scale to fit the window
                gameinit.scaleMode = .fill
                
                // Present the scene
                view.presentScene(gameinit)
            }
            
            //view.ignoresSiblingOrder = true
            
            //view.showsFPS = true
            //view.showsNodeCount = true
        }
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
