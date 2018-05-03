//
//  ViewController.swift
//  Swifty-Companion
//
//  Created by Kiefer Wiessler on 01/05/2018.
//  Copyright © 2018 Kiefer Wiessler. All rights reserved.
//

import UIKit

class SearchController : UIViewController {

    var logins : [Login]?
    let cellID = "loginCell"

    
    lazy var profilController : ProfilController = {
        let layout = UICollectionViewFlowLayout()
        var controller = ProfilController(collectionViewLayout: layout)
        return controller
    }()

    
    let searchField : ZDTextField = {
        let field = ZDTextField()
        field.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.15).cgColor
        field.layer.borderWidth = 1
        field.attributedPlaceholder = NSAttributedString(string: "xlogin", attributes: [NSAttributedStringKey.foregroundColor : UIColor(white: 1, alpha: 0.8)])
        field.autocapitalizationType = .none
        field.layer.cornerRadius = 5
        field.textColor = .white
        field.backgroundColor = UIColor(white: 0, alpha: 0.3)
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    
    let searchButton : UIButton = {
        let button = UIButton()
        button.setTitle("search", for: .normal)
        button.backgroundColor = ZDTools.shared.colors.green
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(handleSearch), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        view.addSubview(searchField)
        view.addSubview(searchButton)
        
//        navigationController?.navigationBar.isHidden = true
        
        
        let background = ZDTools.shared.addBackground(image: "companion-background")
        view.addSubview(background)
        view.sendSubview(toBack: background)
        setConstraints()
        
    }
    

    
    @objc func handleSearch() {

        self.profilController.target = searchField.text?.trim()
        self.profilController.fetchUser()
        self.navigationController?.pushViewController(self.profilController, animated: true)
    }
}



extension SearchController {
    
    func setConstraints() {
        
        
        searchField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        searchField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -33).isActive = true
        searchField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 33).isActive = true
        searchField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        
        searchButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        searchButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -33).isActive = true
        searchButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 33).isActive = true
        searchButton.topAnchor.constraint(equalTo: searchField.safeAreaLayoutGuide.bottomAnchor, constant: 35).isActive = true
    }
    
}

extension SearchController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    
}

extension String
{
    func trim() -> String
    {
        return self.trimmingCharacters(in: NSCharacterSet.whitespaces)
    }
}





