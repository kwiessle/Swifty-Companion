//
//  UserCell.swift
//  Swifty-Companion
//
//  Created by Kiefer Wiessler on 03/05/2018.
//  Copyright © 2018 Kiefer Wiessler. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {
    
    var user : User? {
        willSet {
            picture.image = UIImage()
            name.text = nil
            location.text = nil
        }
        didSet {
            downloadImage()
            name.text = self.user?.displayName
            if let location = self.user?.location { self.location.text = location }
            else { self.location.text = "Unavailable" }
            if let login = self.user?.login { self.loginItem.text = login }
            if let phone = self.user?.phone { self.phoneItem.text = phone }
            else { self.phoneItem.text = "Unavailable" }
            if let mail = self.user?.email { self.mailItem.text = mail }
            if let level = self.user?.cursus[0].level {
                self.level.text = "level : \(String(level))"
                self.progress.progress = Float(level.truncatingRemainder(dividingBy: 1.0))
            }
            if let wallet = self.user?.wallet { self.wallet.text = "\(wallet) ₩"}
            if let points = self.user?.correctionPoint { self.points.text = "\(points) ₽"}
            
        }
    }
    
    let picture : UIImageView = {
        let view = UIImageView()
        view.backgroundColor = ZDTools.shared.colors.foreground
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage()
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 2
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = 70
        view.clipsToBounds = true
        return view
    }()
    
    let name : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let level : UILabel = {
        let label = UILabel()
        label.text = "level : "
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let progress : UIProgressView = {
        let view = UIProgressView()
        view.progressTintColor = ZDTools.shared.colors.green
        view.trackTintColor = UIColor(white: 1, alpha: 0.1)
        view.layer.cornerRadius = 7
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let location : UILabel = {
        let label = UILabel()
        label.textColor = ZDTools.shared.colors.green
        label.text = "Unavailable"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let wallet : UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor(white: 0, alpha: 0.4)
        label.layer.cornerRadius = 5
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor(white: 0.7, alpha: 0.5).cgColor
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        return label
    }()
    
    let points : UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor(white: 0, alpha: 0.4)
        label.layer.cornerRadius = 5
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor(white: 0.7, alpha: 0.5).cgColor
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        return label
    }()
    
    let loginLogo : UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "user")
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let loginItem : UILabel = {
        let label = UILabel()
        label.textColor = ZDTools.shared.colors.font
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let phoneLogo : UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "phone")
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let phoneItem : UILabel = {
        let label = UILabel()
        label.text = "unavailable"
        label.textColor = ZDTools.shared.colors.font
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let mailLogo : UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "mail")
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let mailItem : UILabel = {
        let label = UILabel()
        label.textColor = ZDTools.shared.colors.font
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let shadowView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 0.6)
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
                backgroundColor = .none
        
                addSubview(shadowView)
                addSubview(loginLogo)
                addSubview(loginItem)
                addSubview(phoneLogo)
                addSubview(phoneItem)
                addSubview(mailLogo)
                addSubview(mailItem)
                addSubview(picture)
                addSubview(name)
                addSubview(level)
                addSubview(progress)
                addSubview(wallet)
                addSubview(points)
                addSubview(location)
        
                setLayout()
    }

    
    
    func setLayout() {
        
        shadowView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 120).isActive = true
        shadowView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 22.5).isActive = true
        shadowView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -22.5).isActive = true
        shadowView.heightAnchor.constraint(equalToConstant: 390).isActive = true
        
        wallet.heightAnchor.constraint(equalToConstant: 30).isActive = true
        wallet.widthAnchor.constraint(equalToConstant: 55).isActive = true
        wallet.topAnchor.constraint(equalTo: shadowView.topAnchor, constant: 30).isActive = true
        wallet.leftAnchor.constraint(equalTo: shadowView.leftAnchor, constant: 30).isActive = true
        
        
        points.heightAnchor.constraint(equalToConstant: 30).isActive = true
        points.widthAnchor.constraint(equalToConstant: 55).isActive = true
        points.topAnchor.constraint(equalTo: shadowView.topAnchor, constant: 30).isActive = true
        points.rightAnchor.constraint(equalTo: shadowView.rightAnchor, constant: -30).isActive = true
        
        picture.widthAnchor.constraint(equalToConstant: 140).isActive = true
        picture.heightAnchor.constraint(equalToConstant: 140).isActive = true
        picture.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
        picture.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        name.topAnchor.constraint(equalTo: picture.bottomAnchor, constant: 10).isActive = true
        name.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        name.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        location.topAnchor.constraint(equalTo: name.bottomAnchor).isActive = true
        location.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        location.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        level.topAnchor.constraint(equalTo: location.bottomAnchor, constant: 20).isActive = true
        level.heightAnchor.constraint(equalToConstant: 10).isActive = true
        level.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        progress.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
        progress.heightAnchor.constraint(equalToConstant: 15).isActive = true
        progress.topAnchor.constraint(equalTo: location.bottomAnchor, constant: 40).isActive = true
        progress.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        loginLogo.topAnchor.constraint(equalTo: location.bottomAnchor, constant: 85).isActive = true
        loginLogo.leftAnchor.constraint(equalTo:  leftAnchor, constant: 60).isActive = true
        loginLogo.heightAnchor.constraint(equalToConstant: 20).isActive = true
        loginLogo.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        loginItem.centerYAnchor.constraint(equalTo: loginLogo.centerYAnchor).isActive = true
        loginItem.leftAnchor.constraint(equalTo: loginLogo.rightAnchor, constant: 20).isActive = true
        
        phoneLogo.topAnchor.constraint(equalTo: loginLogo.bottomAnchor, constant: 20).isActive = true
        phoneLogo.leftAnchor.constraint(equalTo:  leftAnchor, constant: 60).isActive = true
        phoneLogo.heightAnchor.constraint(equalToConstant: 20).isActive = true
        phoneLogo.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        phoneItem.centerYAnchor.constraint(equalTo: phoneLogo.centerYAnchor).isActive = true
        phoneItem.leftAnchor.constraint(equalTo: phoneLogo.rightAnchor, constant: 20).isActive = true
        
        mailLogo.topAnchor.constraint(equalTo: phoneLogo.bottomAnchor, constant: 20).isActive = true
        mailLogo.leftAnchor.constraint(equalTo:  leftAnchor, constant: 60).isActive = true
        mailLogo.heightAnchor.constraint(equalToConstant: 20).isActive = true
        mailLogo.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        mailItem.centerYAnchor.constraint(equalTo: mailLogo.centerYAnchor).isActive = true
        mailItem.leftAnchor.constraint(equalTo: mailLogo.rightAnchor, constant: 20).isActive = true
        
    }
    
    func downloadImage() {
        guard let url = user?.imageUrl else { return }
        RequestService.shared.imageDownloader(url: url) { image in
            guard let imageDownloaded = image else { return }
            self.picture.image = imageDownloaded
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
