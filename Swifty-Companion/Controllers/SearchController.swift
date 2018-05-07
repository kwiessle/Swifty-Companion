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
    var isFirst = true
    
    lazy var profilController : ProfilController = {
        let layout = UICollectionViewFlowLayout()
        var controller = ProfilController(collectionViewLayout: layout)
        return controller
    }()

    let schoolLogo : UIView = {
        let view = UIImageView()
        view.image = UIImage(named: "42")
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let searchField : ZDTextField = {
        let field = ZDTextField()
        field.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3).cgColor
        field.layer.borderWidth = 1
        field.attributedPlaceholder = NSAttributedString(string: "xlogin", attributes: [NSAttributedStringKey.foregroundColor : UIColor(white: 1, alpha: 0.6)])
        field.autocapitalizationType = .none
        field.layer.cornerRadius = 5
        field.textColor = .white
        field.backgroundColor = UIColor(white: 0, alpha: 0.45)
        field.keyboardAppearance = .dark
        field.autocorrectionType = .no
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
        button.setBackgroundColor(color: ZDTools.shared.colors.success, forState: UIControlState.highlighted)
        button.clipsToBounds = true
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        APIServices.shared.getToken { _ in }
        
        view.addSubview(schoolLogo)
        view.addSubview(searchField)
        view.addSubview(searchButton)
        
        
        let background = ZDTools.shared.addBackground(image: "companion-background")
        view.addSubview(background)
        view.sendSubview(toBack: background)
        setConstraints()
        
    }
    

    
    @objc func handleSearch() {

        if !isFirst {
            self.profilController.user = nil
            self.profilController.collectionView?.reloadData()
        }
        self.profilController.target = searchField.text?.trim()
        self.profilController.researchFailed = false
        self.profilController.fetchUser()
        self.navigationController?.pushViewController(self.profilController, animated: true)
        isFirst = false
    }
}



extension SearchController {
    
    func setConstraints() {
        
        
        schoolLogo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 90).isActive = true
        schoolLogo.heightAnchor.constraint(equalToConstant: 140).isActive = true
        schoolLogo.widthAnchor.constraint(equalToConstant: 140).isActive = true
        schoolLogo.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        searchField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        searchField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -33).isActive = true
        searchField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 33).isActive = true
        searchField.topAnchor.constraint(equalTo: schoolLogo.safeAreaLayoutGuide.bottomAnchor, constant: 30).isActive = true
        
        searchButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        searchButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -33).isActive = true
        searchButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 33).isActive = true
        searchButton.topAnchor.constraint(equalTo: searchField.safeAreaLayoutGuide.bottomAnchor, constant: 25).isActive = true
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

extension UIButton {
    func setBackgroundColor(color: UIColor, forState: UIControlState) {
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        UIGraphicsGetCurrentContext()!.setFillColor(color.cgColor)
        UIGraphicsGetCurrentContext()!.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
        let colorImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        self.setBackgroundImage(colorImage, for: forState)
    }
}




