//
//  GameScene.swift
//  tunagu
//
//  Created by Owner on 12/27/1397 AP.
//  Copyright © 1397 AP Owner. All rights reserved.
//

import SpriteKit
import GameplayKit
import AVFoundation
import GameKit

var selecttitleplayer:AVAudioPlayer!
let leaderboardId = "tunaguleaderboard1.2.x"

var background = SKSpriteNode(imageNamed: "background")
var none = SKSpriteNode(imageNamed: "none")
var capsulescore = SKSpriteNode(imageNamed: "scorecapsule")
var gameover = SKSpriteNode(imageNamed: "gameover")
let gameoverlabel = SKLabelNode()

var pieces:[piece] = []
var piecepattern:[SKSpriteNode] = []

var fingers:[Int] = [-1,-1,-1,-1,-1]

var score = 0

var time = 0
var passedtime = 0
var passedtimecounter = 0

var gameoverflag = 0

//let userdefaults = UserDefaults.standard

class GameScene: SKScene {
    
    var avplayer:AVAudioPlayer!
    
    let url = Bundle.main.path(forResource: "maobackground", ofType: "mp3")
    
    let url2 = Bundle.main.path(forResource: "select04", ofType: "mp3")

    override func didMove(to view: SKView) {
        
        do{
            try avplayer = AVAudioPlayer(contentsOf: URL(fileURLWithPath: url!))
            avplayer.prepareToPlay()
        }catch{
            print(error)
        }
        do{
            try selecttitleplayer = AVAudioPlayer(contentsOf: URL(fileURLWithPath: url2!))
            selecttitleplayer.prepareToPlay()
        }catch{
            print(error)
        }
        score = 0
        scoredigits = 1
        
        time = 150
        timedigits = 1
        passedtime = 1
        passedtimecounter = 0

        gameoverflag = 0
        
        let timelabel = SKLabelNode()
        timelabel.fontSize = 50
        timelabel.zPosition = 3
        timelabel.fontColor = SKColor.black
        let scorelabel = timelabel.copy() as! SKLabelNode
        timelabel.text = "TIME"
        scorelabel.text = "SCORE"
        timelabel.position =  CGPoint(x: -115,y: 315)
        scorelabel.position = CGPoint(x: 77,y: 315)

        gameoverlabel.fontSize = 60
        gameoverlabel.zPosition = 5
        gameoverlabel.fontColor = SKColor.black
        gameoverlabel.text = "TITLE"
        gameoverlabel.name = "gameover"
        gameoverlabel.position =  CGPoint(x: 0,y: -45)

        addChild(timelabel)
        addChild(scorelabel)
        
        //piece
        var temp = 0
        for i in 8...12{
            var change = 0
            randomcapsele(change: &change)
            setscorecapsule(number: i, change: change,alpha:CGFloat(1.0))
            change = 0
            piecegenerate(number: &temp)
            piecechange(number: i, changenumber: temp,alpha:CGFloat(1.0))
        }
        for i in 15...19{
            var change = 0
            randomcapsele(change: &change)
            setscorecapsule(number: i, change: change,alpha:CGFloat(1.0))
            change = 0
            piecegenerate(number: &temp)
            piecechange(number: i, changenumber: temp,alpha:CGFloat(1.0))
        }
        for i in 22...26{
            var change = 0
            randomcapsele(change: &change)
            setscorecapsule(number: i, change: change,alpha:CGFloat(1.0))
            change = 0
            piecegenerate(number: &temp)
            piecechange(number: i, changenumber: temp,alpha:CGFloat(1.0))
        }
        for i in 29...33{
            var change = 0
            randomcapsele(change: &change)
            setscorecapsule(number: i, change: change,alpha:CGFloat(1.0))
            change = 0
            piecegenerate(number: &temp)
            piecechange(number: i, changenumber: temp,alpha:CGFloat(1.0))
        }
        for i in 36...40{
            var change = 0
            randomcapsele(change: &change)
            setscorecapsule(number: i, change: change,alpha:CGFloat(1.0))
            change = 0
            piecegenerate(number: &temp)
            piecechange(number: i, changenumber: temp,alpha:CGFloat(1.0))
        }
        background.zPosition = 1
        gameover.zPosition = 4
        addChild(background)
        
        for i in 0..<48{
            addChild(pieces[i].piecenode)
            addChild(pieces[i].scorecapsulenode)
        }
        
        avplayer.numberOfLoops = -1
        avplayer.play()
    }
    
    func touchDown(atPoint pos : CGPoint) {
        
        let touchnodes = self.nodes(at: pos)
        
        if gameoverflag == 0{
            fingers = [-1,-1,-1,-1,-1]
            for tnode in touchnodes{
                for i in 0...48{
                    //block16
                    if pieces[i].number != 16{
                        let num = String(format: "%02d", i)
                        if tnode.name == num/*tnode.name?.hasPrefix("player") tnode.name?.hasSuffix("san") == true*/
                        {
                            let temp = tnode.name?.suffix(2)
                            for index in 0...4{
                                if fingers[index] == -1{
                                    fingers[index] = Int(temp!)!
                                    break
                                }
                            }
                        }
                    }
                }
            }
        }else {
            for tnode in touchnodes{
                if tnode.name == "gameover"/*tnode.name?.hasPrefix("player") tnode.name?.hasSuffix("san") == true*/
                {
                    selecttitleplayer.play()
                    if let gametitle = gametitle(fileNamed: "gametitle") {
                        // Set the scale mode to scale to fit the window
                        gametitle.scaleMode = .fill
                        
                        // Present the scene
                        self.view?.presentScene(gametitle)
                    }
                }
            }
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
        if gameoverflag == 0{
            //scorenumber
            for c in 0..<scoredigits{
                removeChildren(in: [scorenumbers[c]])
            }
            scoredigits = 1
            var tempscore = 0
            tempscore = score
            while true {
                tempscore = tempscore / 10
                if tempscore <= 0 {
                    break
                }
                scoredigits += 1
            }
            numberstore(numbers: score, digits: scoredigits)
            scorenumbers = []
            for c in 0..<scoredigits{
                drawnumbers(numbers:&scorenumbers,i:c,number:numbersstore[c], positionX:(CGFloat)(165-40*c), positionY:250, Zposition:3)
            }
            for c in 0..<scoredigits{
                addChild(scorenumbers[c])
            }
            //timenumber
            for c in 0..<timedigits{
                removeChildren(in: [timenumbers[c]])
            }
            passedtimecounter += 1
            if passedtimecounter >= 40 {
                time = time - passedtime
                if time <= 0{
                    time = 0
                }
                passedtimecounter = 0
            }
            timedigits = 1
            var temptime = 0
            temptime = time
            
            while true {
                temptime = temptime / 10
                if temptime <= 0 {
                    break
                }
                timedigits += 1
            }
            numberstore(numbers: time, digits: timedigits)
            timenumbers = []
            for c in 0..<timedigits{
                drawnumbers(numbers:&timenumbers,i:c,number:numbersstore[c], positionX:(CGFloat)(-65-40*c), positionY:250, Zposition:3)
            }
            for c in 0..<timedigits{
                addChild(timenumbers[c])
            }
            
            if erasesuccess == 0{
                for i in 0...4{
                    if fingers[i] != -1{
                        var temp = pieces[fingers[i]].number
                        //blue
                        if temp>=0 && temp<=5{
                            if temp == 0 {
                                temp = 1
                            }else
                            if temp == 1{
                                temp = 3
                            }else
                            if temp == 2{
                                temp = 5
                            }else
                            if temp == 3{
                                temp = 4
                            }else
                            if temp == 4{
                                temp = 2
                            }else
                            if temp == 5 {
                                temp = 0
                            }
                        }
                        //yellow
                        if temp>=6 && temp<=11{
                            temp -= 1
                            if temp <= 5{
                                temp = 11
                            }
                        }
                        //red
                        if temp>=12 && temp<=15{
                            //arc4random()%(max-min+1)+min
                            temp = Int(arc4random()%(15-12+1)+12)
                        }
                        removeChildren(in: [pieces[fingers[i]].piecenode])
                        piecechange(number: fingers[i], changenumber: temp,alpha:CGFloat(1.0))
                        addChild(pieces[fingers[i]].piecenode)
                        fingers = [-1,-1,-1,-1,-1]
                    }
                }
                ///////////////////////////
                for j in 0...48{
                    if  pieces[j].pattern == 0{
                        traceinit(start:j)
                        tracemap[j] = 1
                        tracersee(dir: dir, see: &seecurrent)//ok
                        seetemp = tracercurrent + seecurrent
                        tracerpiecesee(current: tracercurrent, dir: dir, piecepattern: pieces[seetemp].pattern, walksuccess: &walksuccess)
                        if walksuccess != 0{
                            tracerwalk(dir: dir, current: &tracercurrent)
                            dirchange(dir: &dir, piecepattern: pieces[tracercurrent].pattern)
                            tracemap[tracercurrent] = 1
                            firststep = 1
                        }
                        while true {
                            tracersee(dir: dir, see: &seecurrent)//ok
                            seetemp = tracercurrent + seecurrent
                            tracerpiecesee(current: tracercurrent, dir: dir, piecepattern: pieces[seetemp].pattern, walksuccess: &walksuccess)
                            if walksuccess == 0{
                                break
                            }
                            if walksuccess != 0{
                                tracerwalk(dir: dir, current: &tracercurrent)
                                dirchange(dir: &dir, piecepattern: pieces[tracercurrent].pattern)
                                tracemap[tracercurrent] = 1
                                firststep = 1
                            }
                            if tracerorigin == tracercurrent {
                                erasesuccess = 1
                                break
                                
                            }
                        }
                    }
                    if erasesuccess == 1{
                        eraserun = 1
                        erasetime = 0
                        erasetimecounter = 0
                        break
                    }
                }
            }
            if erasesuccess == 1 {
                if eraserun == 1{
                    erasetimecounter += 1
                    if erasetimecounter >= 2{
                        erasetime += 1
                        for i in 0...48{
                            if tracemap[i] == 1 {
                                pieces[i].piecenode.alpha = 1.0 - 0.1 * CGFloat(erasetime)
                                pieces[i].scorecapsulenode.alpha = 1.0 - 0.1 * CGFloat(erasetime)
                                if pieces[i].piecenode.alpha <= 0{
                                    pieces[i].piecenode.alpha = 0
                                    eraserun = 0
                                }
                                if pieces[i].scorecapsulenode.alpha <= 0{
                                    pieces[i].scorecapsulenode.alpha = 0
                                    eraserun = 0
                                }
                            }
                        }
                        erasetimecounter = 0
                    }
                }
                if eraserun == 0{
                    var roundcounter = 1
                    var scorecapsule = 0
                    for i in 0...48{
                        if tracemap[i] == 1 {
                            roundcounter += 6
                            if pieces[i].scorecapsule == 1 {
                                scorecapsule += 1
                            }
                            var temp = 0
                            piecegenerate(number: &temp)
                            removeChildren(in: [pieces[i].piecenode])
                            piecechange(number: i, changenumber: temp,alpha:CGFloat(1.0))
                            addChild(pieces[i].piecenode)
                            
                            var change = 0
                            removeChildren(in: [pieces[i].scorecapsulenode])
                            randomcapsele(change: &change)
                            setscorecapsule(number: i, change: change,alpha:CGFloat(1.0))
                            change = 0
                            addChild(pieces[i].scorecapsulenode)
                        }
                    }
                    score  = score + (roundcounter * roundcounter) + (scorecapsule * 100)
                    erasesuccess = 0
                }
            }
            //gameover
            if time <= 0{
                //gamecenterへ登録
                
                //降順にソートしていたコード 
                /*var matchindex = -1
                
                var tempscore:[Int] = []
                for i in 0...2{
                    let num = String(format: "%d", i)
                    let score = num + "SCORE"
                    tempscore.append(userdefaults.integer(forKey: score))
                }
                //match
                for (index,value) in tempscore.enumerated(){
                    //ここ = 必要
                    if score >= value {
                        matchindex = index
                        break
                    }
                }
                //sort
                if matchindex != -1{
                    var index = tempscore.count-1
                    while index >= matchindex{
                        if index != 0{
                            let tempnumber = tempscore[index-1]
                            tempscore[index] = tempnumber
                        }
                        if index == matchindex{
                            tempscore[matchindex] = score
                            break
                        }
                        index -= 1
                    }
                }
                for i in 0...2{
                    let num = String(format: "%d", i)
                    let score = num + "SCORE"
                    userdefaults.set(tempscore[i], forKey: score)
                }
                */
                sendscore(dayscore: score)
                gameoverflag = 1
                addChild(gameover)
                addChild(gameoverlabel)
            }
        }
    }//updatelast
    
    func sendscore(dayscore:Int){
        let score = GKScore(leaderboardIdentifier: leaderboardId)
        score.value = Int64(dayscore)
        GKScore.report([score]){ error in
            guard error == nil else{
                print("error")
                return
            }
            print("done")
        }
        
    }
}
