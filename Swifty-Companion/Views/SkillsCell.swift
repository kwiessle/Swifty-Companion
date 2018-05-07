//
//  SkillsCell.swift
//  Swifty-Companion
//
//  Created by Kiefer Wiessler on 05/05/2018.
//  Copyright © 2018 Kiefer Wiessler. All rights reserved.
//

import UIKit

class SkillsCell: UICollectionViewCell, UITableViewDataSource, UITableViewDelegate {
    
    
    var skills : [Skills]? {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    lazy var tableView : UITableView = {
        let view = UITableView(frame: frame)
        view.allowsSelection = false
        view.separatorColor = .none
        view.delegate = self
        view.dataSource = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(tableView)
        
        tableView.register(SkillCell.self, forCellReuseIdentifier: "id")
        tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.backgroundColor = ZDTools.shared.colors.background
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return skills?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "id", for: indexPath) as! SkillCell
        cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, UIScreen.main.bounds.width)
        
        cell.backgroundColor = indexPath.item % 2 == 1 ? .none : UIColor(white: 0, alpha: 0.12)
        
        
        guard let data = self.skills else { return cell }
        guard let name = data[indexPath.item].name else { return cell }
        let level = data[indexPath.item].level
        cell.name.text = name
        cell.mark.text = String(level)
        cell.mark.textColor = ZDTools.shared.colors.success
        cell.progressBar.progress = Float(level / 21)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(70)
    }
    
}
