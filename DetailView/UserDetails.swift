//
//  UserDetails.swift
//  Spear Chat
//
//  Created by Spear ON on 21/08/18.
//  Copyright © 2018 Spear. All rights reserved.
//

import UIKit
import RKParallaxEffect

class UserDetails: UITableViewController {
    //var chatM: ResentChatModel!
    var browsingImage = UIImage()
    var nameStr = String()
    var userDesignation = String()
    var mediaCount = 0
    
    //var filteredEmpolyees = [HierarchyEmployee]()

    var parallaxEffect: RKParallaxEffect!
    
    //var header : StretchHeader!
    //Add here your participnat list
    var participantArray = ["Nilesh Fasate", "Vijay", "Ajay", "Kevil", "Shwettank"]
    var items = ["", "", "Media, Links, and Docs", ""]
    
    var isGroup = false
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Info"
        
        if isGroup {
            for participant in participantArray {
                items.append(participant)
            }
        }
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        tableView.tableFooterView = UIView()
        setupHeaderView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if parallaxEffect == nil {
            parallaxEffect = RKParallaxEffect(tableView: tableView)
            parallaxEffect.isParallaxEffectEnabled = true
            parallaxEffect.isFullScreenTapGestureRecognizerEnabled = true
            parallaxEffect.isFullScreenPanGestureRecognizerEnabled = true
        }
        tableView.reloadData()
    }
   
    func setupHeaderView() {
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 300))
        imageView.image = browsingImage
        imageView.contentMode = .scaleAspectFill
        
        tableView.tableHeaderView = imageView
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
    }
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 70
//    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        if indexPath.row == 0 {
            var cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "TableViewCell")
            cell.textLabel?.text = nameStr
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            cell.detailTextLabel?.text = userDesignation
            return cell
            
        }else if indexPath.row < 4 {
            var cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)
            cell = UITableViewCell(style: .value1, reuseIdentifier: "TableViewCell")
            
            let itemText = items[indexPath.row]
            cell.textLabel?.text = itemText
            if itemText == "" {
                if indexPath.row == 3 {
                    cell.textLabel?.text = "Participants"
                }
                cell.backgroundColor = UIColor.groupTableViewBackground
                cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                return cell
            }else  {
                if indexPath.row == 2 {
                    cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                }
                cell.imageView?.image = #imageLiteral(resourceName: "article")
                cell.accessoryType = .disclosureIndicator
                cell.detailTextLabel?.text = "\(mediaCount)"
                return cell
            }
        }else {
            //Create here your custom cell for participant
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)
            cell.imageView?.image = #imageLiteral(resourceName: "article")
            let itemText = items[indexPath.row]
            cell.textLabel?.text = itemText
            cell.detailTextLabel?.text = "\(mediaCount)"
            return cell
        }
    }
}
