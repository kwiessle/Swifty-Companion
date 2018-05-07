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
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let ProgressBar: UIProgressView = {
        let bar = UIProgressView()
        bar.translatesAutoresizingMaskIntoConstraints = false
        return bar
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        
        addSubview(name)
        addSubview(mark)
        addSubview(ProgressBar)

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
        
        ProgressBar.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        ProgressBar.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.5).isActive = true
        ProgressBar.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor, constant: 15).isActive = true
    }


}
