//
//  Projects.swift
//  Swifty-Companion
//
//  Created by Kiefer Wiessler on 03/05/2018.
//  Copyright © 2018 Kiefer Wiessler. All rights reserved.
//

import Foundation


struct ProjectInfos : Decodable {
    let name : String
    
    private enum CodingKeys: CodingKey, String {
        case name
    }
}

struct Project : Decodable {
    let finalMark : Int?
    let infos : ProjectInfos
    
    private enum CodingKeys: CodingKey, String {
        case finalMark = "final_mark"
        case infos = "project"
        
    }
    
}
