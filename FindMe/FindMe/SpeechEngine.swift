//
//  SpeechEngine.swift
//  FindMe
//
//  Created by Benjamin Su on 1/12/17.
//  Copyright © 2017 Benjamin Su. All rights reserved.
//

import Foundation
import SpriteKit

class SpeechEngine {
    
    static func typeWriterMessage(label: SKLabelNode, text: String) -> SKAction {
        
        var tempText = ""
        var sequence: [SKAction] = []
        
        let waitAction = SKAction.wait(forDuration: 0.12)
        
        for char in text.characters {
            
            tempText += "\(char)"
            let tempText1 = tempText
            let action = SKAction.run {
                
                label.text = tempText1
                
            }
            
            sequence.append(action)
            sequence.append(waitAction)
            
        }
        
        return SKAction.sequence(sequence)
        
    }
    
}
