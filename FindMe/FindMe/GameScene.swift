//
//  GameScene.swift
//  FindMe
//
//  Created by Benjamin Su on 1/9/17.
//  Copyright © 2017 Benjamin Su. All rights reserved.
//

import SpriteKit
import GameplayKit
import UIKit
class GameScene: SKScene {
    
    private var player : SKSpriteNode?
    private var hudLayer : HUDLayer?
    private var swipe: UIPanGestureRecognizer?
    private var mainCamera: SKCameraNode?
    
    override func didMove(to view: SKView) {
        
        self.hudLayer = HUDLayer()
        
        self.player = scene?.childNode(withName: "player") as? SKSpriteNode
        
        self.mainCamera = SKCameraNode()
        
        self.swipe = UIPanGestureRecognizer(target: self, action: #selector(movePlayer))
        
        self.view?.addGestureRecognizer(swipe!)
        
        self.addChild(self.mainCamera!)
        
        self.mainCamera?.addChild(hudLayer!)
        
        self.camera = mainCamera
    }
    
    
    

    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        player?.physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: 100))
        
    }
    
    
    
    override func update(_ currentTime: TimeInterval) {
        
        camera?.position = (player?.position)!
        
    }
    
    
    func movePlayer(gesture: UIPanGestureRecognizer) {
        
        let direction = gesture.velocity(in: self.view).x
        
        if direction < 0 {
            
            player?.physicsBody?.applyImpulse(CGVector(dx: -20, dy: 0.0))
            
        }  else if direction > 0 {
            
            player?.physicsBody?.applyImpulse(CGVector(dx: 20, dy: 0.0))
            
        }
        
    }
    
    
    
    
    
    
   }
