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
    
    static func typeWriterMessage(label: SKLabelNode, text: String) {
        
        var tempText = ""
        var wait: Double = 0
        
        for char in text.characters {
            
            wait += 0.1
            let time = DispatchTime(uptimeNanoseconds: DispatchTime.now().rawValue + UInt64(wait * Double(NSEC_PER_SEC)))
            
            DispatchQueue.main.asyncAfter(deadline: time, execute: {
                
                tempText += "\(char)"
                label.text = tempText
                
            })
        }
    }
    
}
