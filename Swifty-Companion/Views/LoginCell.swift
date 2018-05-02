//
//  LoginCell.swift
//  Swifty-Companion
//
//  Created by Kiefer Wiessler on 01/05/2018.
//  Copyright © 2018 Kiefer Wiessler. All rights reserved.
//

import UIKit

class LoginCell : UITableViewCell {
    
    var login : Login? {
        didSet {
            guard let name = self.login!.login else { return }
            loginLabel.text = name
        }
    }
    
    let loginLabel : UILabel = {
        let label = UILabel()
        label.text = "zdp"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .black
        addSubview(loginLabel)
        
        setConstraints()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension LoginCell {
    func setConstraints() {
        loginLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        loginLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        loginLabel.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        loginLabel.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
    }
}
