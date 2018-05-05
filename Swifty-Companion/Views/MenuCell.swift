//
//  MenuCell.swift
//  Swifty-Companion
//
//  Created by Kiefer Wiessler on 03/05/2018.
//  Copyright © 2018 Kiefer Wiessler. All rights reserved.
//

import UIKit

class MenuCell: UICollectionViewCell {
    
    let logo : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "home")?.withRenderingMode(.alwaysTemplate)
        view.tintColor = UIColor(white: 0, alpha: 0.4)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(logo)
        
        setConstraints()
    }
    
    override var isSelected: Bool {
        didSet {
            if self.isSelected { logo.tintColor = .white }
            else { logo.tintColor = UIColor(white: 0, alpha: 0.4) }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension MenuCell {
    
    func setConstraints() {
        logo.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        logo.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        logo.widthAnchor.constraint(equalToConstant: 28).isActive = true
        logo.heightAnchor.constraint(equalToConstant: 28).isActive = true
    }
}
