//
//  MapController.swift
//  hackGSU
//
//  Created by Viraj Shah on 10/13/16.
//  Copyright © 2016 Panther Hackers. All rights reserved.
//


import Foundation
import UIKit

class MapController: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    
    let cellId = "cellId"
    
    let imageNames = ["concourse", "firstfloor"]
    let floorNames = ["CONCOURSE FLOOR", "FIRST FLOOR"]
    
    override func viewDidLoad() {
        collectionView?.backgroundColor = .white
        setupNavBarAttributes()
        setupCollectionView()
}
    
    func setupNavBarAttributes(){
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLabel.text = " Map"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        navigationItem.titleView = titleLabel
        
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = .systemColor("green")
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        let moreButton = UIBarButtonItem(image: UIImage(named: "menu"), style: .plain, target: self, action: #selector(menuTap))
        moreButton.tintColor = UIColor.white
        navigationItem.rightBarButtonItems = [moreButton]
        
        
    }
    
    func setupCollectionView(){
        
        if let flowlayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowlayout.minimumLineSpacing = 5
            flowlayout.minimumInteritemSpacing = 5
        }
        
        collectionView?.register(MapCell.self, forCellWithReuseIdentifier: cellId)

        collectionView?.contentInset = UIEdgeInsetsMake(0, 0, 49, 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, 49, 0)
        
        collectionView?.backgroundColor = UIColor(red:0.90, green:0.89, blue:0.90, alpha:1.00)
    }
    
    
    lazy var menuLauncher : announcementMenuLauncher = {
        let launcher = announcementMenuLauncher()
        launcher.mapController = self
        return launcher
    }()
    
    func menuTap(){
        menuLauncher.showSettings()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height/1.5)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MapCell
        cell.mapImageView.image = UIImage(named: imageNames[indexPath.item])
        
        cell.floorLabel.text = floorNames[indexPath.item]
        
        return cell
        
    }
    
    func showViewControllerForSetting(_ setting: Setting){
        let name = setting.name
        
        switch (name){
        case "About Us":
            navigationController?.pushViewController(AboutViewController(collectionViewLayout: UICollectionViewFlowLayout()), animated: true)

        case "Sponsors":
            navigationController?.pushViewController(Sponsor(), animated: true)
        case "Check out the Prizes":
            navigationController?.pushViewController(PrizesViewController(), animated: true)
        case "Code of Conduct":
            navigationController?.pushViewController(CodeOfConductViewController(), animated: true)
        case "Request A Mentor":
            navigationController?.pushViewController(MentorViewController(collectionViewLayout: UICollectionViewFlowLayout()), animated: true)
        case "Send Feedback":
            navigationController?.pushViewController(SendFeedbackController(), animated: true)
        default:
            return
        }
    }
    
}
