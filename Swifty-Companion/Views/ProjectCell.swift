//
//  ProjectCell.swift
//  Swifty-Companion
//
//  Created by Kiefer Wiessler on 03/05/2018.
//  Copyright © 2018 Kiefer Wiessler. All rights reserved.
//

import UIKit

class ProjectCell : UITableViewCell {
    
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
    
    let separator :  UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 0.5)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        backgroundColor = .none
        
        addSubview(name)
        addSubview(mark)
        addSubview(separator)
        
        name.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        name.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        mark.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        mark.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        separator.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        separator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        separator.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension UITableViewCell {
    
    func hideSeparator() {
        self.separatorInset = UIEdgeInsets(top: 0, left: self.bounds.size.width, bottom: 0, right: 0)
    }
    
    func showSeparator() {
        self.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
