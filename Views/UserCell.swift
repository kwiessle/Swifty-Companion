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
        didSet {
            downloadImage()
            name.text = self.user?.displayName
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
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = ZDTools.shared.colors.background
        
        addSubview(picture)
        addSubview(name)
        
        setLayout()
        
        
    }
    
    func setLayout() {
        
        picture.widthAnchor.constraint(equalToConstant: 140).isActive = true
        picture.heightAnchor.constraint(equalToConstant: 140).isActive = true
        picture.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        picture.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        name.topAnchor.constraint(equalTo: picture.bottomAnchor, constant: 20).isActive = true
        name.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        name.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
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
