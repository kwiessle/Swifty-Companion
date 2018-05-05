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
            setProgressBar()
        }
    }
    
    let picture : UIImageView = {
        let view = UIImageView()
        view.backgroundColor = ZDTools.shared.colors.foreground
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage()
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = 70
        view.clipsToBounds = true
        return view
    }()
    
    let name : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 40)
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
    
  
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = ZDTools.shared.colors.background
        
        addSubview(picture)
        addSubview(name)
        addSubview(location)
        
        setLayout()
        setProgressBar()
        
    }
    
    
    func setProgressBar() {
        
        guard let level = self.user?.cursus[0].level else { print("failed"); return }
        
        let holder = UIView(frame: CGRect(x: frame.width/2 - 150, y: 290, width: 300, height: 30))
        holder.translatesAutoresizingMaskIntoConstraints = false
        holder.backgroundColor = UIColor(white: 0, alpha: 0.8)
        holder.layer.borderColor = UIColor.white.cgColor
        holder.layer.borderWidth = 1
        holder.layer.cornerRadius = 5
        holder.clipsToBounds = true
        
        addSubview(holder)
        
        
        let percent = level.truncatingRemainder(dividingBy: 1.0)
        
        
        let label = UITextView(frame: CGRect(x: 0, y: -2, width: 300, height: 30))
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12)
        label.text = "\(String(level)) %"
        label.backgroundColor = UIColor(white: 1, alpha: 0)
        label.textColor = .white
        
     

        
        let progress = UIView(frame: CGRect(x: 2, y: 2, width: holder.frame.width * CGFloat(percent) - 4 , height: holder.frame.height - 4))
        progress.translatesAutoresizingMaskIntoConstraints = false
        progress.backgroundColor = ZDTools.shared.colors.green
       
   
        progress.layer.cornerRadius = 2
        
      
        progress.addSubview(label)
         holder.addSubview(progress)
        
       
        
       
       print("passed")
        
        
        
   
        
        
    }
    
    func setLayout() {
        
        picture.widthAnchor.constraint(equalToConstant: 140).isActive = true
        picture.heightAnchor.constraint(equalToConstant: 140).isActive = true
        picture.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        picture.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        name.topAnchor.constraint(equalTo: picture.bottomAnchor, constant: 10).isActive = true
        name.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        name.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        location.topAnchor.constraint(equalTo: name.bottomAnchor).isActive = true
        location.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        location.heightAnchor.constraint(equalToConstant: 10).isActive = true
        
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
