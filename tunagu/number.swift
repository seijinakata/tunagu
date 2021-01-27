//
//  number.swift
//  tunagu
//
//  Created by Owner on 2/4/1398 AP.
//  Copyright © 1398 AP Owner. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

var scorenumbers:[SKSpriteNode] = []
var scoredigits = 0

var timenumbers:[SKSpriteNode] = []
var timedigits = 0

var topnumbers:[SKSpriteNode] = []
var topdigits = 0

var middlenumbers:[SKSpriteNode] = []
var middledigits = 0

var undernumbers:[SKSpriteNode] = []
var underdigits = 0

var numbernode:[SKSpriteNode] = []
var numbersstore:[Int] = []

func numberstore(numbers:Int,digits:Int){
    numbersstore = []
    var numberbasic = numbers
    var number = 0
    for _ in 0..<digits {
        number =  numberbasic%10
        numbersstore.append(number)
        numberbasic =  numberbasic/10
    }
}

func drawnumbers(numbers:inout [SKSpriteNode], i:Int,number:Int,positionX:CGFloat,positionY:CGFloat,Zposition:CGFloat){
    let numbernodecopy = numbernode[number].copy() as! SKSpriteNode
    numbers.append(numbernodecopy)
    numbers[i].position.x = positionX
    numbers[i].position.y = positionY
    numbers[i].zPosition = Zposition
}
func rankdraw(score:Int,positionx:Int,positiony:Int,positionz:Int,numbers:inout [SKSpriteNode]){
        var scoredigits = 1
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
        numbers = []
        for c in 0..<scoredigits{
            drawnumbers(numbers:&numbers,i:c,number:numbersstore[c], positionX:(CGFloat)(positionx-40*c), positionY:(CGFloat)(positiony), Zposition:(CGFloat)(positionz))
        }
}
/*
//ランキングシーンにスコアを書いていた関数
func scoredraw(key:String,digits:inout Int,positionx:Int,positiony:Int,positionz:Int, numbers:inout [SKSpriteNode]){
    var score = -1
    score = userdefaults.integer(forKey: key)
    
    digits = 1
    var tempscore = 0
    tempscore = score
    while true {
        tempscore = tempscore / 10
        if tempscore <= 0 {
            break
        }
        digits += 1
    }
    if score >= 0{
        rankdraw(score: score, positionx: positionx, positiony: positiony, positionz: positionz,numbers: &numbers)
    }
}
*/
