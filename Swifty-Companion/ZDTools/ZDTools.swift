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
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        
        let view = UIImageView(frame: CGRect(x:0, y:0, width: width, height: height))
        view.image = UIImage(named: image)
        view.contentMode = UIViewContentMode.scaleAspectFill
        
        return view
    }
    
}


