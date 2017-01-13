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


class HUDLayer: SKSpriteNode {
    
    var bottomToolbar: SKSpriteNode!
    var jumpButton: SKSpriteNode!
    var moveLeft: SKSpriteNode!
    var moveRight: SKSpriteNode!
    var mainLabel: SKLabelNode!
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
        setupBottomToolBar()
        setupJumpButton()
        setupMoveLeftButton()
        setupMoveRightButton()
        setupMainLabel()
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

//MARK: - Creating of HUD sublayers
extension HUDLayer {
    
    func setupBottomToolBar() {
    
        bottomToolbar = SKSpriteNode(color: UIColor.brown, size: CGSize(width: self.size.width, height: self.size.height * 0.2))
        bottomToolbar.position = CGPoint(x: 0.0, y: self.size.height * -0.4)
        self.addChild(bottomToolbar)
        
    }
    
    func setupJumpButton() {
        
        jumpButton = SKSpriteNode(color: UIColor.blue, size: CGSize(width: self.size.width * 0.1, height: self.size.height * 0.15))
        jumpButton.position = CGPoint(x: self.size.width * 0.35, y: self.size.height * -0.4)
        self.addChild(jumpButton)
        
    }
    
    func setupMoveLeftButton() {
        
        moveLeft = SKSpriteNode(color: UIColor.green, size: CGSize(width: self.size.width * 0.1, height: self.size.height * 0.15))
        moveLeft.position = CGPoint(x: self.size.width * -0.35, y: self.size.height * -0.4)
        self.addChild(moveLeft)
        
    }
    
    func setupMoveRightButton() {
        
        moveRight = SKSpriteNode(color: UIColor.yellow, size: CGSize(width: self.size.width * 0.1, height: self.size.height * 0.15))
        moveRight.position = CGPoint(x: self.size.width * -0.25, y: self.size.height * -0.4)
        self.addChild(moveRight)
        
    }
    
    func setupMainLabel() {
        
        mainLabel = SKLabelNode()
        mainLabel.position = CGPoint(x: 0.0, y: self.size.height * 0.25)
        mainLabel.fontSize = 24
        mainLabel.fontColor = UIColor.white
        mainLabel.fontName = "Courier-Bold"
        self.addChild(mainLabel)
        
    }
    
}

