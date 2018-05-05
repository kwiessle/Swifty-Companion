//
//  ZDTools.swift
//  Swifty-Companion
//
//  Created by Kiefer Wiessler on 03/05/2018.
//  Copyright © 2018 Kiefer Wiessler. All rights reserved.
//

import UIKit


final class ZDTools {
    
    static var shared = ZDTools()
    
    let colors = ZDColors()

    
    func addBackground(image: String) -> UIImageView {
        let view = UIImageView(frame: UIScreen.main.bounds)
        view.image = UIImage(named: image)
        view.contentMode = UIViewContentMode.scaleAspectFill
        
        return view
    }
    
}


