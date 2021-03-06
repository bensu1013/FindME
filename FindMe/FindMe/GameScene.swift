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



class GameScene: SKScene, SKPhysicsContactDelegate {
    
    private var player = Player.main.player
    private var hudLayer: HUDLayer!
    private var mainCamera: SKCameraNode!
    
    override func didMove(to view: SKView) {
        
        self.physicsWorld.contactDelegate = self
        self.addChild(player)
        self.player.position = CGPoint(x: 0.0, y: 0.0)
        
        self.hudLayer = HUDLayer(texture: nil, color: UIColor.clear, size: CGSize(width: self.size.width, height: self.size.height))
        self.hudLayer.position = CGPoint.zero
        self.hudLayer.zPosition = 100
        
        self.mainCamera = SKCameraNode()
        self.mainCamera.addChild(hudLayer)
        self.addChild(self.mainCamera)
        self.camera = mainCamera
        
        self.run(LevelOne.introSequence(label: hudLayer.mainLabel))
    
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first!.location(in: hudLayer)
        hudLayer.startTouch(touch: touch)
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first!.location(in: hudLayer)
        hudLayer.startTouch(touch: touch)
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {

        let touch = touches.first!.location(in: hudLayer)
        hudLayer.endTouch(touch: touch)
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        camera?.position = player.position
        Player.main.update()
        
    }
    
    
    func didBegin(_ contact: SKPhysicsContact) {
        let firstBody: SKPhysicsBody!
        let secondBody: SKPhysicsBody!
        
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
            firstBody = contact.bodyA
            secondBody = contact.bodyB
        } else {
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }
        
        if ((firstBody.categoryBitMask & BitmaskCategory.PlayerBody) != 0 &&
            (secondBody.categoryBitMask & BitmaskCategory.Doodad != 0)) {
            if !LevelOne.treeTriggered {
                LevelOne.treeTriggered = true
                self.removeAllActions()
                self.run(LevelOne.treeSequence(label: hudLayer.mainLabel))
            }
            
        }
        if ((firstBody.categoryBitMask & BitmaskCategory.PlayerBody) != 0 &&
            (secondBody.categoryBitMask & BitmaskCategory.EventTrigger != 0)) {
            if !LevelOne.jumpSpeechTriggered {
                LevelOne.jumpSpeechTriggered = true
                self.removeAllActions()
                self.run(LevelOne.jumpSequence(label: hudLayer.mainLabel))
            }
            
        }
        
        if ((firstBody.categoryBitMask & BitmaskCategory.PlayerFoot != 0) &&
            (secondBody.categoryBitMask & BitmaskCategory.SteppingPlatform != 0)) {
            
            Player.main.isJumping = false
            Player.main.stopGliding()
            print("start")
            
        }
        
    }
    
    func didEnd(_ contact: SKPhysicsContact) {
        let firstBody: SKPhysicsBody!
        let secondBody: SKPhysicsBody!
        
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
            firstBody = contact.bodyA
            secondBody = contact.bodyB
        } else {
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }
        
        if ((firstBody.categoryBitMask & BitmaskCategory.PlayerFoot != 0) &&
            (secondBody.categoryBitMask & BitmaskCategory.SteppingPlatform != 0)) {
            
            Player.main.isJumping = true
            print("end")
            
        }
        
    }
    
}








