//
//  Constants.swift
//  FindMe
//
//  Created by Benjamin Su on 1/12/17.
//  Copyright © 2017 Benjamin Su. All rights reserved.
//

import Foundation


struct CollisionCategory {
    static let PlayerCategory   : UInt32 = 0x1 << 0
    static let TreeCategory : UInt32 = 0x1 << 1
    //    let BlockCategory  : UInt32 = 0x1 << 2
    //    let PaddleCategory : UInt32 = 0x1 << 3
    static let BorderCategory : UInt32 = 0x1 << 4
}