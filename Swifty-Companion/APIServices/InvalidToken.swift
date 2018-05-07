//
//  InvalidToken.swift
//  Swifty-Companion
//
//  Created by Kiefer Wiessler on 05/05/2018.
//  Copyright © 2018 Kiefer Wiessler. All rights reserved.
//

import Foundation


struct InvalidToken : Decodable {
    
    let error : String?
    
    private enum CodingKeys: String, CodingKey {
        case error
    }
    
}
