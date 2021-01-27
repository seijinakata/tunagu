//
//  piece.swift
//  tunagu
//
//  Created by Owner on 1/10/1398 AP.
//  Copyright © 1398 AP Owner. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

struct piece {
    //0:下右,1:左下,2:横,3:上左,4:右上,5:縦,6:block
    var pattern:Int
    var piecenode:SKSpriteNode
    //pieceの番号
    var number:Int
    var scorecapsule:Int
    var scorecapsulenode:SKSpriteNode
}
func randomcapsele(change:inout Int){
    let randint = Int(arc4random()%20)
    if randint > 12 {
        change = 1
    }
}
func setscorecapsule(number:Int,change:Int,alpha:CGFloat){
    pieces[number].scorecapsulenode.removeFromParent()
    if change == 1{
        let tempscorecapsule = capsulescore.copy() as! SKSpriteNode
        pieces[number].scorecapsulenode = tempscorecapsule
        pieces[number].scorecapsulenode.zPosition = 3
        pieces[number].scorecapsulenode.position.x = CGFloat((-152-76) + (76*(number%7)))
        pieces[number].scorecapsulenode.position.y = CGFloat((62+76) - (76*(number/7)))
        pieces[number].scorecapsulenode.alpha = alpha
        pieces[number].scorecapsule = 1
    }
    if change == 0{
        let tempscorecapsule = none.copy() as! SKSpriteNode
        pieces[number].scorecapsulenode = tempscorecapsule
        pieces[number].scorecapsulenode.zPosition = 3
        pieces[number].scorecapsulenode.position.x = CGFloat((-152-76) + (76*(number%7)))
        pieces[number].scorecapsulenode.position.y = CGFloat((62+76) - (76*(number/7)))
        pieces[number].scorecapsulenode.alpha = alpha
        pieces[number].scorecapsule = 0
    }
}
//piece変えるposition.xy注意
func piecechange(number:Int,changenumber:Int,alpha:CGFloat){
    pieces[number].piecenode.removeFromParent()
    
    let piecetemp = piecepattern[changenumber].copy() as! SKSpriteNode
    piecetemp.zPosition = 2
    piecetemp.position.x = CGFloat((-152-76) + (76*(number%7)))
    piecetemp.position.y = CGFloat((62+76) - (76*(number/7)))
    piecetemp.alpha = alpha
    let numbertemp = String(format: "%02d", number)
    pieces[number].piecenode = piecetemp
    pieces[number].piecenode.name = numbertemp
    pieces[number].pattern = changenumber%6
    if changenumber == 14 {
        pieces[number].pattern = 3
    }
    if changenumber == 15 {
        pieces[number].pattern = 4
    }
    pieces[number].number = changenumber
}

func piecegenerate(number:inout Int){
    let randint = Int(arc4random()%20)
    //blue
    if randint > 9 {
        number = Int(arc4random()%6)
    }
    //yellow
    if randint <= 9 && randint > 1{
        number = Int(arc4random()%(11-6+1)+6)
    }
    //red
    if randint <= 1{
        number = Int(arc4random()%(15-12+1)+12)
    }
}
