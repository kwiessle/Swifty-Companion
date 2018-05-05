//
//  Cursus.swift
//  Swifty-Companion
//
//  Created by Kiefer Wiessler on 03/05/2018.
//  Copyright © 2018 Kiefer Wiessler. All rights reserved.
//

import Foundation


struct Cursus : Decodable {
    let grade : String?
    let level : Double
    
    private enum CodingKeys: String, CodingKey {
        case grade, level
    }
    
}
