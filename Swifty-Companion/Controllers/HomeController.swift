//
//  ViewController.swift
//  Swifty-Companion
//
//  Created by Kiefer Wiessler on 01/05/2018.
//  Copyright © 2018 Kiefer Wiessler. All rights reserved.
//

import UIKit

class HomeController : UIViewController {

    var logins : [Login]?
    let cellID = "loginCell"

    let searchField : CustomTextField = {
        let field = CustomTextField()
        field.layer.borderColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1).cgColor
        field.layer.borderWidth = 1
        field.layer.cornerRadius = 5
        field.textColor = .red
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    
    let searchButton : UIButton = {
        let button = UIButton()
        button.setTitle("search", for: .normal)
        button.backgroundColor = .red
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
        
        
        setConstraints()
    }
    
    @objc func handleSearch() {
        guard let login = searchField.text else { return }
        guard let request = APIServices.shared.createRequest(for: "/v2/users/\(login)") else { return }
        
        RequestService.shared.get(req: request, for: User.self) { data in
            if let data = data {
                print(data)
            }
        }
        
    }
}
    

extension HomeController {
    
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

class CustomTextField:UITextField{
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect.init(x: bounds.origin.x + 8, y: bounds.origin.y, width: bounds.width, height: bounds.height)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return self.textRect(forBounds:bounds)
    }
}



