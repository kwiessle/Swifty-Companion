//
//  Skills.swift
//  Swifty-Companion
//
//  Created by Kiefer Wiessler on 05/05/2018.
//  Copyright © 2018 Kiefer Wiessler. All rights reserved.
//

import Foundation


struct Skills : Decodable {
    let name : String?
    let level : Double
    
    private enum CodingKeys: String, CodingKey {
        case name, level
    }
    
}
