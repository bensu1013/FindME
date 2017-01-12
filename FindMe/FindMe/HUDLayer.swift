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
    
    static var main = HUDLayer()
    
    var jumpButton: SKSpriteNode!
    var moveLeft: SKSpriteNode!
    var moveRight: SKSpriteNode!
    var mainLabel: SKLabelNode!
    
    private override init() {
        
        super.init()
        
        jumpButton = SKSpriteNode(color: UIColor.blue, size: CGSize(width: UIScreen.main.bounds.width * 0.1, height: UIScreen.main.bounds.width * 0.1))
        jumpButton.position = CGPoint(x: UIScreen.main.bounds.width * 0.45, y: UIScreen.main.bounds.height * -0.45)
        self.addChild(jumpButton)
        
        moveLeft = SKSpriteNode(color: UIColor.green, size: CGSize(width: UIScreen.main.bounds.width * 0.1, height: UIScreen.main.bounds.width * 0.1))
        moveLeft.position = CGPoint(x: UIScreen.main.bounds.width * -0.45, y: UIScreen.main.bounds.height * -0.45)
        self.addChild(moveLeft)
        
        moveRight = SKSpriteNode(color: UIColor.green, size: CGSize(width: UIScreen.main.bounds.width * 0.1, height: UIScreen.main.bounds.width * 0.1))
        moveRight.position = CGPoint(x: UIScreen.main.bounds.width * -0.35, y: UIScreen.main.bounds.height * -0.45)
        self.addChild(moveRight)
        
        mainLabel = SKLabelNode()
        mainLabel.position = CGPoint(x: 0.0, y: UIScreen.main.bounds.height * 0.25)
        mainLabel.color = UIColor.darkGray
        self.addChild(mainLabel)
        
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
            
            Player.main.jumping()
            
        } else if moveRight.contains(touch) {
            
            Player.main.movement = .none
            
        } else if moveLeft.contains(touch) {
            
            Player.main.movement = .none
            
        }
        moveRight.color = UIColor.green
        moveLeft.color = UIColor.green
    }
    
    func moveLeftTapped() {
        moveLeft.color = UIColor.blue
        Player.main.movement = .left
    }
    
    func moveRightTapped() {
        moveRight.color = UIColor.blue
        Player.main.movement = .right
    }
    
    
}



