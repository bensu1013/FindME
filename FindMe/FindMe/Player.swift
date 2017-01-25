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
    var footNode = SKSpriteNode()
    
    fileprivate var moveLeftTextures: [SKTexture] = []
    fileprivate var moveRightTextures: [SKTexture] = []
    
    var isJumping = false
    private var isGliding = false
    
    var movement: Movement = .none
    
    private init() {
        
        loadTextures()
        loadPlayer()
        loadFootNode()
        
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
        
        if isGliding {
            
            if (player.physicsBody?.velocity.dy)! < 0.0 {
                if player.physicsBody?.affectedByGravity == true {
                    player.physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: -1))
                    player.physicsBody?.affectedByGravity = false
                    print(1)
                }
                
            }
            
        } else {
            
            if player.physicsBody?.affectedByGravity == false {
                 player.physicsBody?.affectedByGravity = true
            }
            
        }
        
    }
    
    func jumping() {
        if !isJumping {
            player.physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: 40))
        }
    }
    
    func startGliding() {
        
        self.isGliding = true
        
    }
    
    func stopGliding() {
        
        self.isGliding = false
        
    }
    
    
}


//MARK : -Initializer methods
extension Player {
    
    func loadTextures() {
        moveLeftTextures.append(SKTexture(imageNamed: "AdaLeft"))
        moveRightTextures.append(SKTexture(imageNamed: "AdaRight"))
    }
    
    func loadPlayer() {
        player = SKSpriteNode(texture: moveRightTextures[0], color: UIColor.clear, size: CGSize(width: 32.0, height: 64.0))
        
        player.physicsBody = SKPhysicsBody(rectangleOf: player.frame.size)
        player.physicsBody?.restitution = 0.0
        player.physicsBody?.usesPreciseCollisionDetection = true
        player.physicsBody?.allowsRotation = false
        player.physicsBody?.categoryBitMask = BitmaskCategory.PlayerBody
        player.physicsBody?.contactTestBitMask = BitmaskCategory.Doodad | BitmaskCategory.EventTrigger
        player.physicsBody?.collisionBitMask = BitmaskCategory.SteppingPlatform
    }
    
    func loadFootNode() {
        footNode = SKSpriteNode(color: UIColor.clear, size: CGSize(width: 8.0, height: 8.0))
        player.addChild(footNode)
        footNode.position = CGPoint(x: 0.0, y: player.frame.size.height / -2)
        footNode.physicsBody = SKPhysicsBody(rectangleOf: footNode.frame.size)
        footNode.physicsBody?.allowsRotation = false
        footNode.physicsBody?.pinned = true
        footNode.physicsBody?.categoryBitMask = BitmaskCategory.PlayerFoot
        footNode.physicsBody?.contactTestBitMask = BitmaskCategory.SteppingPlatform
        footNode.physicsBody?.collisionBitMask = 0
    }
    
}



