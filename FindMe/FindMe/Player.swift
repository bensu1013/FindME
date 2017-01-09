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

class Player: SKSpriteNode {
    
    static var player = Player(texture: nil, color: UIColor.green, size: CGSize(width: 32.0, height: 64.0))
    

    
    var movement: Movement = .none
    
    private override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
        physicsBody = SKPhysicsBody(rectangleOf: self.frame.size)
        physicsBody?.allowsRotation = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update() {
        
        switch movement {
        case .left:
            self.physicsBody?.velocity.dx = -200
        case .right:
            self.physicsBody?.velocity.dx = 200
        case .none:
            break
        }
   
    }
    
    func jumping() {
        self.physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: 50))
    }
    
}
