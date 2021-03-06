//
//  FoodAlertCell.swift
//  hackGSU
//
//  Created by Viraj Shah on 10/17/16.
//  Copyright © 2016 Panther Hackers. All rights reserved.
//

import UIKit
import Firebase

class FoodAlertCell : FeedCell{
    override func observeAnnouncements() {
        
            let ref = FIRDatabase.database().reference().child("announcements")
            ref.observe(.childAdded, with: { (snapshot) in
                
                print(snapshot)
                
                if let dictionary = snapshot.value as? [String: Any]{
                    
                    let announcement = Announcement()
                    
                    if let title = dictionary["title"] as? String!{
                        announcement.title = title
                        
                    }
                    if let bodyText = dictionary["bodyText"] as? String!{
                        announcement.bodyText = bodyText
                    }
                    if let timestamp = dictionary["timestamp"] as! NSNumber?{
                        announcement.timestamp = timestamp
                    }
                    if let topic = dictionary["topic"] as? String!{
                        announcement.topic = topic
                    }
                    if let fromId = dictionary["fromId"] as? String!{
                        announcement.fromId = fromId
                    }
                    
                    if let topic = dictionary["topic"] as! String?{
                        if topic == "FOOD" {
                            self.firebaseAnnouncements.append(announcement)
                        }
                    }
                    
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                    
                    
                }
                }, withCancel: nil)
            
        
    }
}
