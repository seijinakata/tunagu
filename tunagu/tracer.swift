//
//  tracer.swift
//  tunagu
//
//  Created by Owner on 1/20/1398 AP.
//  Copyright © 1398 AP Owner. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

var tracerorigin:Int = 0
var tracercurrent:Int = 0
var tracemap = Array(repeating: 0, count: 49)
//up=1,right=2,down=3,left=4
var dir:Int = 0
var walksuccess = 0
var erasesuccess = 0
var firststep = 0
var seecurrent = 0
var seetemp = 0
var eraserun = 0
var erasetime = 0
var erasetimecounter = 0
//0:下右,1:左下,2:横,3:上左,4:右上,5:縦,6:block

func traceinit(start:Int){
    for i in 0...48{
        tracemap[i] = 0
    }
    dir = 2
    walksuccess = 1
    tracerorigin = start
    tracercurrent = start
    seecurrent = start
    tracemap[start] = 1
    erasesuccess = 0
    firststep = 0
    seetemp = 0
    eraserun = 0
    erasetime = 0
    erasetimecounter = 0
}
func dirchange(dir:inout Int,piecepattern:Int){
    if piecepattern == 0{
        if dir == 1{
            dir = 2
        }
        if dir == 4{
            dir = 3
        }
    }
    if piecepattern == 1{
        if dir == 2{
            dir = 3
        }
        if dir == 1{
            dir = 4
        }
    }
    if piecepattern == 2{
        
    }
    if piecepattern == 3{
        if dir == 3{
            dir = 2
        }
        if dir == 4{
            dir = 1
        }
    }
    if piecepattern == 4{
        if dir == 2{
            dir = 1
        }
        if dir == 3{
            dir = 4
        }
    }
    if piecepattern == 5{
        
    }
    
}
func tracerpiecesee(current:Int,dir:Int,piecepattern:Int,walksuccess:inout Int){
    if piecepattern == 6{
        walksuccess = 0
    }
    if dir == 1{
        if piecepattern == 2{
            walksuccess = 0
        }
        if piecepattern == 3{
            walksuccess = 0
        }
        if piecepattern == 4{
            walksuccess = 0
        }
    }
    if dir == 2{
        if piecepattern == 0{
            walksuccess = 0
        }
        if piecepattern == 3{
            walksuccess = 0
        }
        if piecepattern == 5{
            walksuccess = 0
        }
    }
    if dir == 3{
        if piecepattern == 0{
            walksuccess = 0
        }
        if piecepattern == 1{
            walksuccess = 0
        }
        if piecepattern == 2{
            walksuccess = 0
        }
    }
    if dir == 4{
        if piecepattern == 1{
            walksuccess = 0
        }
        if piecepattern == 4{
            walksuccess = 0
        }
        if piecepattern == 5{
            walksuccess = 0
        }
    }
}
func tracerwalk(dir:Int,current:inout Int){
    //
    if dir == 1{
        current -= 7
    }
    if dir == 2{
        current += 1
    }
    if dir == 3{
        current += 7
    }
    if dir == 4{
        current -= 1
    }
}
func tracersee(dir:Int,see:inout Int){
    //
    if dir == 1{
        see = -7
    }
    if dir == 2{
        see = 1
    }
    if dir == 3{
        see = 7
    }
    if dir == 4{
        see = -1
    }
}
