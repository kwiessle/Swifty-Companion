//
//  UserCell.swift
//  Swifty-Companion
//
//  Created by Kiefer Wiessler on 03/05/2018.
//  Copyright © 2018 Kiefer Wiessler. All rights reserved.
//

import UIKit

class UserCell: UICollectionViewCell {
    
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
            if let mail = self.user?.email { self.mailItem.text = mail }
            
        addSubview(setProgressBar())
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
    
    
    let location : UILabel = {
        let label = UILabel()
        label.textColor = ZDTools.shared.colors.green
        label.text = "Unavailable"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let loginLogo : UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "card")
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let loginItem : UILabel = {
        let label = UILabel()
        label.textColor = ZDTools.shared.colors.green
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
        label.textColor = ZDTools.shared.colors.green
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
        label.textColor = ZDTools.shared.colors.green
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(patternImage: UIImage(named: "companion-background")!)
    
        addSubview(shadowView)
        addSubview(loginLogo)
        addSubview(loginItem)
        addSubview(phoneLogo)
        addSubview(phoneItem)
        addSubview(mailLogo)
        addSubview(mailItem)
        addSubview(picture)
        addSubview(name)
        addSubview(location)
        
    
        setLayout()

        
    }
    
    
    func setProgressBar() -> UIView {
        
        guard let level = self.user?.cursus[0].level else { print("failed"); return UIView() }
        
        let holder = UIView(frame: CGRect(x: frame.width/2 - 140, y: 290, width: 280, height: 30))
        holder.translatesAutoresizingMaskIntoConstraints = false
        holder.backgroundColor = UIColor(white: 0, alpha: 0.8)
        holder.layer.borderColor = UIColor.white.cgColor
        holder.layer.borderWidth = 2
        holder.layer.cornerRadius = 5
        holder.clipsToBounds = true
        
        let percent = level.truncatingRemainder(dividingBy: 1.0)
        let label = UITextView(frame: CGRect(x: 0, y: -3, width: 280, height: 30))
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12)
        label.text = "\(String(level)) %"
        label.backgroundColor = UIColor(white: 1, alpha: 0)
        label.textColor = .white
        
        let progress = UIView(frame: CGRect(x: 3, y: 3, width: holder.frame.width * CGFloat(percent) - 6 , height: holder.frame.height - 6))
        progress.translatesAutoresizingMaskIntoConstraints = false
        progress.backgroundColor = ZDTools.shared.colors.green
        progress.layer.cornerRadius = 2
        progress.addSubview(label)
        
        holder.addSubview(progress)
        return holder
    }
    
    func setLayout() {
        
        shadowView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 120).isActive = true
        shadowView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 22.5).isActive = true
        shadowView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -22.5).isActive = true
        shadowView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -22.5).isActive = true
        
        picture.widthAnchor.constraint(equalToConstant: 140).isActive = true
        picture.heightAnchor.constraint(equalToConstant: 140).isActive = true
        picture.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 45).isActive = true
        picture.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        name.topAnchor.constraint(equalTo: picture.bottomAnchor, constant: 10).isActive = true
        name.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        name.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        location.topAnchor.constraint(equalTo: name.bottomAnchor).isActive = true
        location.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        location.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        loginLogo.topAnchor.constraint(equalTo: location.bottomAnchor, constant: 90).isActive = true
        loginLogo.leftAnchor.constraint(equalTo:  leftAnchor, constant: 50).isActive = true
        loginLogo.heightAnchor.constraint(equalToConstant: 30).isActive = true
        loginLogo.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        loginItem.centerYAnchor.constraint(equalTo: loginLogo.centerYAnchor).isActive = true
        loginItem.leftAnchor.constraint(equalTo: loginLogo.rightAnchor, constant: 20).isActive = true
        
        phoneLogo.topAnchor.constraint(equalTo: loginLogo.bottomAnchor, constant: 20).isActive = true
        phoneLogo.leftAnchor.constraint(equalTo:  leftAnchor, constant: 50).isActive = true
        phoneLogo.heightAnchor.constraint(equalToConstant: 30).isActive = true
        phoneLogo.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        phoneItem.centerYAnchor.constraint(equalTo: phoneLogo.centerYAnchor).isActive = true
        phoneItem.leftAnchor.constraint(equalTo: phoneLogo.rightAnchor, constant: 20).isActive = true
        
        mailLogo.topAnchor.constraint(equalTo: phoneLogo.bottomAnchor, constant: 20).isActive = true
        mailLogo.leftAnchor.constraint(equalTo:  leftAnchor, constant: 50).isActive = true
        mailLogo.heightAnchor.constraint(equalToConstant: 30).isActive = true
        mailLogo.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
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
