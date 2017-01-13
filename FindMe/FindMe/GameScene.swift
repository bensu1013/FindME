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
        print(touch)
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
        let bodyA = contact.bodyA
        let bodyB = contact.bodyB
        
        if (bodyA.categoryBitMask == 2 && bodyB.categoryBitMask == 1) ||
            (bodyA.categoryBitMask == 1 && bodyB.categoryBitMask == 2) {
            if !LevelOne.treeTriggered {
                LevelOne.treeTriggered = true
                self.run(LevelOne.treeSequence(label: hudLayer.mainLabel))
            }
            
        }
        if (bodyA.categoryBitMask == 8 && bodyB.categoryBitMask == 1) ||
            (bodyA.categoryBitMask == 1 && bodyB.categoryBitMask == 8) {
            if !LevelOne.jumpSpeechTriggered {
                LevelOne.jumpSpeechTriggered = true
                self.run(LevelOne.jumpSequence(label: hudLayer.mainLabel))
            }
            
        }
        
    }
    
    
}








