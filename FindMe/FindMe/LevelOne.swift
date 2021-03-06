//
//  LevelOneIntro.swift
//  FindMe
//
//  Created by Benjamin Su on 1/12/17.
//  Copyright © 2017 Benjamin Su. All rights reserved.
//

import Foundation
import SpriteKit

struct LevelOne {

    static var treeTriggered = false
    static var jumpSpeechTriggered = false
}

//MARK: - Introduction to level
extension LevelOne {

    static func introSequence(label: SKLabelNode) -> SKAction {
        
        let intro1 = SpeechEngine.typeWriterMessage(label: label, text: "Hello Ada.")
        let intro2 = SpeechEngine.typeWriterMessage(label: label, text: "I'm glad you are awake.")
        let intro3 = SpeechEngine.typeWriterMessage(label: label, text: "I was becoming quite worried.")
        let intro4 = SpeechEngine.typeWriterMessage(label: label, text: "Lets go!")
        let clear = SKAction.run { label.text = "" }
        
        return SKAction.sequence([.wait(forDuration: 1), intro1, .wait(forDuration: 1), intro2, .wait(forDuration: 1), intro3, .wait(forDuration: 1), intro4, .wait(forDuration: 1), clear])
        
    }
    
    static func treeSequence(label: SKLabelNode) -> SKAction {
        
        let speech1 = SpeechEngine.typeWriterMessage(label: label, text: "Look Ada.")
        let speech2 = SpeechEngine.typeWriterMessage(label: label, text: "It's a tree.")
        let speech3 = SpeechEngine.typeWriterMessage(label: label, text: "Kind of spooky.")
        let speech4 = SpeechEngine.typeWriterMessage(label: label, text: "Lets leave it alone")
        let clear = SKAction.run { label.text = "" }
        
        return SKAction.sequence([.wait(forDuration: 1), speech1, .wait(forDuration: 1), speech2, .wait(forDuration: 1), speech3, .wait(forDuration: 1), speech4, .wait(forDuration: 1), clear])
        
    }
    
    static func jumpSequence(label: SKLabelNode) -> SKAction {
        
        let speech1 = SpeechEngine.typeWriterMessage(label: label, text: "This is quite troublesome,")
        let speech2 = SpeechEngine.typeWriterMessage(label: label, text: "Lets turn back around.")
        let speech3 = SpeechEngine.typeWriterMessage(label: label, text: "Don't go up there.")
        let clear = SKAction.run { label.text = "" }
        
        return SKAction.sequence([.wait(forDuration: 1), speech1, .wait(forDuration: 1), speech2, .wait(forDuration: 1), speech3, .wait(forDuration: 1), clear])
        
    }
    
}

