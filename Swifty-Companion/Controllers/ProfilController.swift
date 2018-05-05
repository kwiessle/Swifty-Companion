//
//  ProfilController.swift
//  Swifty-Companion
//
//  Created by Kiefer Wiessler on 03/05/2018.
//  Copyright © 2018 Kiefer Wiessler. All rights reserved.
//

import UIKit

class ProfilController : UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let userCellID = "userCellID"
    let resultsCellID = "resultsCellID"
    let titles : [String] = ["Profil", "Results", "Stats"]
    
    var target : String?
    var user : User?
    
    var scrollX : CGFloat = {
        return  0
    }()
    
    lazy var menuBar : Menu = {
        var menu = Menu()
        menu.translatesAutoresizingMaskIntoConstraints = false
        menu.layer.cornerRadius = 20
        menu.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        menu.clipsToBounds = true
        menu.profilController = self
        return menu
    }()
    

    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
            flowLayout.minimumLineSpacing = 0
        }
        
        let navigationTitle = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        navigationTitle.textColor = .white
        navigationTitle.text = "Profil"
        navigationTitle.font = UIFont.systemFont(ofSize: 20.0)
        
        
        navigationController?.navigationBar.barTintColor = ZDTools.shared.colors.green
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey(rawValue: NSAttributedStringKey.foregroundColor.rawValue): UIColor.white]
        navigationItem.titleView = navigationTitle
       
        collectionView?.register(UserCell.self, forCellWithReuseIdentifier: userCellID)
        collectionView?.register(ResultsCell.self, forCellWithReuseIdentifier: resultsCellID)
        collectionView?.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        collectionView?.isPagingEnabled = true
        
        
        view.addSubview(menuBar)
        
        menuBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        menuBar.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        menuBar.heightAnchor.constraint(equalToConstant: 50).isActive = true
   
        
      
        
//        downloadImage()
      
    
  
    }
    
    func fetchUser() {
        guard let login = target else { return }
        guard let request = APIServices.shared.createRequest(for: "/v2/users/\(login)") else { return }
        
        RequestService.shared.get(req: request, for: User.self) { [unowned self] data in
            if let data = data {
                self.user = data
                self.collectionView?.reloadData()
                
            }
        }
    }
    
    func scrollToMenuIndex(index: Int) {
        let indexPath = IndexPath(item: index, section: 0)
        collectionView?.scrollToItem(at: indexPath, at: [], animated: true)
        
        setTitleForMenuIndex(index: index)
    }
    
    private func setTitleForMenuIndex(index: Int) {
        if let title = navigationItem.titleView as? UILabel {
            title.text = "\(titles[Int(index)])"
        }
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollX =  scrollView.contentOffset.x / 3
        menuBar.horizontalBarLeftAnchor?.constant = scrollX
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let index = targetContentOffset.move().x / view.frame.width
        let indexPath = IndexPath(item: Int(index), section: 0)
        
        menuBar.collectionView.selectItem(at: indexPath, animated: true, scrollPosition: [])
        
        setTitleForMenuIndex(index: Int(index))
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.item {
            case 0:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: userCellID, for: indexPath) as! UserCell
                cell.user = self.user
                return cell
            case 1 :
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: resultsCellID, for: indexPath) as! ResultsCell
                cell.projects = self.user?.projects
                return cell
            default: return collectionView.dequeueReusableCell(withReuseIdentifier: resultsCellID, for: indexPath) as! ResultsCell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height - 50)
    }
}






