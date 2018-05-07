//
//  SkillCell.swift
//  Swifty-Companion
//
//  Created by Kiefer WIESSLER on 5/7/18.
//  Copyright © 2018 Kiefer Wiessler. All rights reserved.
//

import UIKit

class SkillCell : UITableViewCell {
    
    let mark : UILabel = {
        let label = UILabel()
        label.text = nil
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let name : UILabel = {
        let label = UILabel()
        label.text = nil
        label.textColor = ZDTools.shared.colors.font
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let progressBar: UIProgressView = {
        let bar = UIProgressView()
        bar.translatesAutoresizingMaskIntoConstraints = false
        bar.progressTintColor = ZDTools.shared.colors.green
        bar.trackTintColor = UIColor(white: 1, alpha: 0.1)
        bar.layer.cornerRadius = 2
        bar.clipsToBounds = true
        return bar
    }()
    
    let separator :  UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 0.5)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        
        addSubview(name)
        addSubview(mark)
        addSubview(progressBar)
        addSubview(separator)
        
        setConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension SkillCell {
    
    func setConstraints() {
        
        name.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        name.heightAnchor.constraint(equalToConstant: 20).isActive = true
        name.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -15).isActive = true
        
        mark.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
        mark.heightAnchor.constraint(equalToConstant: 20).isActive = true
        mark.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        progressBar.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        progressBar.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.725).isActive = true
        progressBar.heightAnchor.constraint(equalToConstant: 4).isActive = true
        progressBar.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor, constant: 15).isActive = true
        
        separator.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        separator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        separator.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 1).isActive = true
    }


}
