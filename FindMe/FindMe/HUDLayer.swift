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
    
    var moveController = SKSpriteNode()
    
    override init() {
        super.init()
        self.addChild(jumpButton)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
//    func setupMoveController() {
//        self.addSubview(moveController)
//        
//        let moveGesture = UIPanGestureRecognizer(target: self, action: #selector(moveControllerAction))
//        
//        moveController.backgroundColor = UIColor.green
//        moveController.addGestureRecognizer(moveGesture)
//        moveController.frame = CGRect(x: 0.0, y: UIScreen.main.bounds.height * 0.9, width: UIScreen.main.bounds.width * 0.08, height: UIScreen.main.bounds.height * 0.1)
//    }
//    
//    func moveControllerAction(gesture: UIPanGestureRecognizer) {
//        print(1)
//        let direction = gesture.velocity(in: self).x
//        
//        if direction < 0 {
//            
//            player?.physicsBody?.applyImpulse(CGVector(dx: -20, dy: 0.0))
//            
//        }  else if direction > 0 {
//            
//            player?.physicsBody?.applyImpulse(CGVector(dx: 20, dy: 0.0))
//            
//        }
    
    
}



