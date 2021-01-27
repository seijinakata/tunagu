//
//  draw.swift
//  tunagu
//
//  Created by Owner on 12/28/1397 AP.
//  Copyright © 1397 AP Owner. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

func imagetonode(imagename:String,triming:CGRect)->SKSpriteNode{
    let i = trimingimage(image: UIImage(named: imagename)!, trimingArea: triming)
    let texture = SKTexture(image: i)
    let trimNode = SKSpriteNode(texture: texture)
    return trimNode
}

func trimingimage(image:UIImage,trimingArea:CGRect)->UIImage{
    let imgRef = image.cgImage?.cropping(to: trimingArea)
    let trimImage = UIImage(cgImage: imgRef!, scale: image.scale, orientation: image.imageOrientation)
    return trimImage
}
