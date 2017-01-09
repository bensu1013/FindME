//
//  HUDLayer.swift
//  FindMe
//
//  Created by Benjamin Su on 1/9/17.
//  Copyright © 2017 Benjamin Su. All rights reserved.
//

import Foundation
import SpriteKit
import UIKit


class HUDLayer: SKNode {
    
    var jumpButton: SKSpriteNode {
        
        let button = SKSpriteNode(color: UIColor.blue, size: CGSize(width: UIScreen.main.bounds.width * 0.1, height: UIScreen.main.bounds.width * 0.1))
        button.position = CGPoint(x: UIScreen.main.bounds.width * 0.45, y: UIScreen.main.bounds.height * -0.45)
        
        return button
    }
    
    var moveLeft: SKSpriteNode {
        
        let button = SKSpriteNode(color: UIColor.green, size: CGSize(width: UIScreen.main.bounds.width * 0.1, height: UIScreen.main.bounds.width * 0.1))
        button.position = CGPoint(x: UIScreen.main.bounds.width * -0.45, y: UIScreen.main.bounds.height * -0.45)
        
        return button
        
    }
    
    var moveRight: SKSpriteNode {
        
        let button = SKSpriteNode(color: UIColor.green, size: CGSize(width: UIScreen.main.bounds.width * 0.1, height: UIScreen.main.bounds.width * 0.1))
        button.position = CGPoint(x: UIScreen.main.bounds.width * -0.35, y: UIScreen.main.bounds.height * -0.45)
        
        return button
        
    }
    
    override init() {
        
        super.init()
        self.addChild(jumpButton)
        self.addChild(moveLeft)
        self.addChild(moveRight)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
        
    }
    
    func startTouch(touch: CGPoint) {
        
        if moveRight.contains(touch) {
            
            moveRightTapped()
            
        } else if moveLeft.contains(touch) {
            
            moveLeftTapped()
            
        }
        
    }
    
    func endTouch(touch: CGPoint) {
        
        if jumpButton.contains(touch) {
            
            Player.player.jumping()
            
        } else if moveRight.contains(touch) {
            
            Player.player.movement = .none
            
        } else if moveLeft.contains(touch) {
            
            Player.player.movement = .none
            
        }
        
    }
    
    func moveLeftTapped() {
        moveLeft.color = UIColor.blue
        Player.player.movement = .left
    }
    
    func moveRightTapped() {
        moveRight.color = UIColor.blue
        Player.player.movement = .right
    }
    
    
}



