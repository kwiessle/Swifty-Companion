//
//  EmptyCell.swift
//  Swifty-Companion
//
//  Created by Kiefer Wiessler on 05/05/2018.
//  Copyright © 2018 Kiefer Wiessler. All rights reserved.
//


import UIKit

class EmptyCell : UICollectionViewCell {
    
    let notFound : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 30)
        label.textColor = ZDTools.shared.colors.green
        label.text = "Not Found"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let logo : UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "loupe")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(notFound)
        addSubview(logo)
        
        notFound.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor).isActive = true
        notFound.heightAnchor.constraint(equalToConstant: 40).isActive = true
        notFound.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
        notFound.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor).isActive = true
        
        logo.bottomAnchor.constraint(equalTo: notFound.topAnchor, constant: -30).isActive = true
        logo.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
        logo.heightAnchor.constraint(equalToConstant: 80).isActive = true
        logo.widthAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


