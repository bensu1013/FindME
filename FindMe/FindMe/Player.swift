//
//  Player.swift
//  FindMe
//
//  Created by Benjamin Su on 1/9/17.
//  Copyright © 2017 Benjamin Su. All rights reserved.
//

import Foundation
import SpriteKit

enum Movement {
    case left, right, none
}

class Player {
    
    static var main = Player()
    
    var player = SKSpriteNode()
    private var moveLeftTextures: [SKTexture] = []
    private var moveRightTextures: [SKTexture] = []

    
    var movement: Movement = .none
    
    private init() {
        
        moveLeftTextures.append(SKTexture(imageNamed: "AdaLeft"))
        moveRightTextures.append(SKTexture(imageNamed: "AdaRight"))
        
        player = SKSpriteNode(texture: moveRightTextures[0], color: UIColor.clear, size: CGSize(width: 32.0, height: 64.0))
        
        player.physicsBody = SKPhysicsBody(rectangleOf: player.frame.size)
        player.physicsBody?.allowsRotation = false
        player.physicsBody?.categoryBitMask = CollisionCategory.PlayerCategory
        player.physicsBody?.contactTestBitMask = CollisionCategory.TreeCategory
        player.physicsBody?.collisionBitMask = CollisionCategory.BorderCategory
        
    }

    func update() {
        
        switch movement {
        case .left:
            player.physicsBody?.velocity.dx = -200
            player.texture = moveLeftTextures[0]
        case .right:
            player.physicsBody?.velocity.dx = 200
            player.texture = moveRightTextures[0]
        case .none:
            break
        }
   
    }
    
    func jumping() {
        player.physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: 40))
    }
    
}
