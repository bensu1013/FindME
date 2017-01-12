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
    
    private var player = Player.main.player
    private var hudLayer : HUDLayer!
    private var swipe: UIPanGestureRecognizer!
    private var mainCamera: SKCameraNode!
    
    override func didMove(to view: SKView) {

        self.hudLayer = HUDLayer()
        
        self.addChild(player)
        self.player.position = CGPoint(x: 0.0, y: 0.0)
        
        self.mainCamera = SKCameraNode()
        
        self.addChild(self.mainCamera)

        self.mainCamera.addChild(hudLayer)
        
        self.camera = mainCamera
        
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
    

    
    
}








