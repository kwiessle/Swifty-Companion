//
//  User.swift
//  Swifty-Companion
//
//  Created by Kiefer Wiessler on 02/05/2018.
//  Copyright © 2018 Kiefer Wiessler. All rights reserved.
//

import Foundation



struct User: Decodable {
    let id: Int
    let login : String
    let email : String
    let phone : String?
    let displayName : String
    let location : String?
    let wallet : Int
    let correctionPoint : Int
    let imageUrl : String
    let cursus : [Cursus]
    let projects : [Project]
    let staff : Bool
  


    
    private enum CodingKeys: String, CodingKey {
        case id, login, email, phone, location, wallet
        case displayName = "displayname"
        case correctionPoint = "correction_point"
        case imageUrl = "image_url"
        case cursus = "cursus_users"
        case projects = "projects_users"
        case staff = "staff?"
    }
}


