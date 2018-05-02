//
//  ViewController.swift
//  Swifty-Companion
//
//  Created by Kiefer Wiessler on 01/05/2018.
//  Copyright © 2018 Kiefer Wiessler. All rights reserved.
//

import UIKit

class HomeController : UITableViewController {

    var logins : [Login]?
    let cellID = "loginCell"
    let api = RequestService.shared
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(LoginCell.self, forCellReuseIdentifier: cellID)
        view.backgroundColor = .black
        getCatalog()
    }
    

    func getCatalog() {
        guard let request = APIServices.shared.createRequest(for: "/v2/users") else { print("zr"); return }
        print("zdl=k")
        RequestService.shared.get(req: request, for: [Login].self) { data in
            self.logins = data
            self.tableView.reloadData()
        }
    }}


extension HomeController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return logins?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! LoginCell
        cell.login = logins?[indexPath.item]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height / 12
    }
    
}
