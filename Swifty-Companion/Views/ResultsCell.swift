//
//  ResultsCell.swift
//  Swifty-Companion
//
//  Created by Kiefer Wiessler on 03/05/2018.
//  Copyright © 2018 Kiefer Wiessler. All rights reserved.
//

import UIKit



class ResultsCell: UICollectionViewCell, UITableViewDataSource, UITableViewDelegate {

    
    var projects : [Project]? {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    lazy var tableView : UITableView = {
        let view = UITableView(frame: frame)
        view.allowsSelection = false
        view.delegate = self
        view.dataSource = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(tableView)
        
        tableView.register(ProjectCell.self, forCellReuseIdentifier: "id")
        
        tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.backgroundColor = ZDTools.shared.colors.background
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projects?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "id", for: indexPath) as! ProjectCell
        cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, UIScreen.main.bounds.width)
        cell.backgroundColor = indexPath.item % 2 == 1 ? .none : UIColor(white: 0, alpha: 0.12)
        
        guard let data = projects else { return cell }
        
        guard let mark = data[indexPath.item].finalMark else { return cell }
        guard let validated = data[indexPath.item].validated else { return cell }
        let name = data[indexPath.item].infos.name
        
        cell.name.text = name
        cell.mark.text = String(mark)
        cell.mark.textColor = validated ? ZDTools.shared.colors.success : ZDTools.shared.colors.failure
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(50)
    }
    
}
