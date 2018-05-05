//
//  loadingCell.swift
//  Swifty-Companion
//
//  Created by Kiefer Wiessler on 05/05/2018.
//  Copyright © 2018 Kiefer Wiessler. All rights reserved.
//

import UIKit

class LoadingCell : UICollectionViewCell {
    

    let loadingWheel : UIActivityIndicatorView = {
        let wheel = UIActivityIndicatorView()
        wheel.color = ZDTools.shared.colors.green
        wheel.translatesAutoresizingMaskIntoConstraints = false
        return wheel
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(loadingWheel)
        loadingWheel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        loadingWheel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        loadingWheel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
        loadingWheel.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
