//
//  LevelOneIntro.swift
//  FindMe
//
//  Created by Benjamin Su on 1/12/17.
//  Copyright © 2017 Benjamin Su. All rights reserved.
//

import Foundation
import SpriteKit

class LevelOne {
    
    var introSequence: SKAction!
    var treeSequence: SKAction!
    var treeTriggered = false
    
    init() {
        
        loadIntro()
        loadTreeSpeech()
        
    }
    
    fileprivate func waitFor(_ duration: Double) -> SKAction {
        
        let wait = SKAction.wait(forDuration: duration)
        return wait
        
    }
    
}

//MARK: - Introduction to level
extension LevelOne {
    fileprivate func loadIntro() {
        let intro1 = SKAction.run {
            SpeechEngine.typeWriterMessage(label: HUDLayer.main.mainLabel, text: "Hello Ada.")
        }
        let intro2 = SKAction.run {
            SpeechEngine.typeWriterMessage(label: HUDLayer.main.mainLabel, text: "Are you ready?")
        }
        let intro3 = SKAction.run {
            SpeechEngine.typeWriterMessage(label: HUDLayer.main.mainLabel, text: "We are running out of time!")
        }
        let intro4 = SKAction.run {
            SpeechEngine.typeWriterMessage(label: HUDLayer.main.mainLabel, text: "Lets go!")
        }
        let clear = SKAction.run {
            HUDLayer.main.mainLabel.text = ""
        }
        introSequence = SKAction.sequence([waitFor(1), intro1, waitFor(2), intro2, waitFor(2), intro3, waitFor(4), intro4, waitFor(2), clear])
    }
}

extension LevelOne {
    
    fileprivate func loadTreeSpeech() {
        let speech1 = SKAction.run {
            SpeechEngine.typeWriterMessage(label: HUDLayer.main.mainLabel, text: "Look Ada.")
        }
        let speech2 = SKAction.run {
            SpeechEngine.typeWriterMessage(label: HUDLayer.main.mainLabel, text: "It's a tree.")
        }
        let speech3 = SKAction.run {
            SpeechEngine.typeWriterMessage(label: HUDLayer.main.mainLabel, text: "Kind of spooky.")
        }
        let speech4 = SKAction.run {
            SpeechEngine.typeWriterMessage(label: HUDLayer.main.mainLabel, text: "Lets leave it alone")
        }
        let clear = SKAction.run {
            HUDLayer.main.mainLabel.text = ""
        }
        treeSequence = SKAction.sequence([waitFor(1), speech1, waitFor(2), speech2, waitFor(2), speech3, waitFor(3), speech4, waitFor(4), clear])
    }
    
    
}
