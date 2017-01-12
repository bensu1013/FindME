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
    private var hudLayer = HUDLayer.main
    private var mainCamera: SKCameraNode!
    private var textSequences: LevelOne!
    
    override func didMove(to view: SKView) {
        
        self.physicsWorld.contactDelegate = self
        
        self.addChild(player)
        self.player.position = CGPoint(x: 0.0, y: 0.0)
        
        self.mainCamera = SKCameraNode()
        self.addChild(self.mainCamera)
        self.mainCamera.addChild(hudLayer)
        
        self.camera = mainCamera
        
        textSequences = LevelOne()
        
        self.run(textSequences.introSequence)
    
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
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
        let bodyA = contact.bodyA
        let bodyB = contact.bodyB
        
        if (bodyA.categoryBitMask == 2 && bodyB.categoryBitMask == 1) ||
            (bodyA.categoryBitMask == 1 && bodyB.categoryBitMask == 2) {
            if !textSequences.treeTriggered {
                textSequences.treeTriggered = true
                self.run(textSequences.treeSequence)
            }
            
        }
        
        
    }
    
    
}








