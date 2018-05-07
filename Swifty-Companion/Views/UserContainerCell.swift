//
//  UserContainerCell.swift
//  Swifty-Companion
//
//  Created by Kiefer Wiessler on 07/05/2018.
//  Copyright © 2018 Kiefer Wiessler. All rights reserved.
//

import UIKit

class UserContainerCell: UICollectionViewCell, UITableViewDataSource, UITableViewDelegate {
    
    var user : User? {
        didSet {
            tableView.reloadData()
        }
    }
    
    lazy var tableView : UITableView = {
        let view = UITableView(frame: frame)
        view.allowsSelection = false
        view.separatorColor = UIColor(white: 1, alpha: 0)
        view.delegate = self
        view.dataSource = self
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .none
        return view
    }()
    

    
    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = UIColor(patternImage: UIImage(named: "companion-background")!)
        addSubview(tableView)
        
        tableView.register(UserCell.self, forCellReuseIdentifier: "cellID")
        tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    
}


extension UserContainerCell {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(500)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as! UserCell
        cell.user = self.user
        return cell
    }

}
