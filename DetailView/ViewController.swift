//
//  ViewController.swift
//  DetailView
//
//  Created by NILESH_iOS on 21/08/18.
//  Copyright © 2018 iDev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var tableView:UITableView!
    //var headerView:CategoryHeaderView!
    var headerHeightConstraint:NSLayoutConstraint!
    
    let items = ["","", "Image", "Video", "Audio"]
    var headerViews: UIView?
    private let kTableHeaderHeight: CGFloat = 300.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = UIColor.white
        //setUpHeader()
        setUpTableView()
        
        headerViews = tableView.tableHeaderView
        tableView.tableHeaderView = nil
        tableView.addSubview(headerViews!)
        tableView.contentInset = UIEdgeInsets(top: kTableHeaderHeight, left: 0, bottom: 0, right: 0)
        tableView.contentOffset = CGPoint(x: 0, y: -kTableHeaderHeight)
        updateHeaderView()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateHeaderView() {
        var headerRect = CGRect(x: 0, y: -kTableHeaderHeight, width: tableView.bounds.width, height: kTableHeaderHeight)
        if tableView.contentOffset.y < -kTableHeaderHeight {
            headerRect.origin.y = tableView.contentOffset.y
            headerRect.size.height = -tableView.contentOffset.y
        }
        
        headerViews?.frame = headerRect
    }
    
//    func setUpHeader() {
//        headerView = CategoryHeaderView()
//        headerView.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(headerView)
//
//        headerHeightConstraint = headerView.heightAnchor.constraint(equalToConstant: 150)
//        headerHeightConstraint.isActive = true
//
//        let constraints:[NSLayoutConstraint] = [
//            headerView.topAnchor.constraint(equalTo: view.topAnchor),
//            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
//        ]
//        NSLayoutConstraint.activate(constraints)
//    }
    
    func setUpTableView() {
        
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        let constraints:[NSLayoutConstraint] = [
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
        
        tableView.register(UITableViewCell.self,forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        
        let headerView: UIView = UIView.init(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 300))
        headerView.backgroundColor = .red
        tableView.tableHeaderView = headerView
    }
    
    func animateHeader() {
        
        self.headerHeightConstraint.constant = 150
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
        
    }
}

extension ViewController:UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //let cell = tableView.dequeueReusableCell(withIdentifier: "cell",   for: indexPath)
        
        let cellIdentifier = "cell"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.value2, reuseIdentifier: cellIdentifier)
        }
        
        //cell.textLabel?.text = "Article \(indexPath.row)"
        if indexPath.row == 0 {
            cell?.textLabel?.text = "Nilesh Fasate"
            cell?.detailTextLabel?.text = "+919766314963"
        }else {
            let text = self.items[indexPath.row]
            if text == "" {
                cell?.backgroundColor = UIColor.groupTableViewBackground
            }
            cell?.textLabel?.text = self.items[indexPath.row]
            cell?.detailTextLabel?.text = ""
        }
        
        return cell!
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 65
        }
        
        let text = self.items[indexPath.row]
        if text == "" {
            return 35
        }
        
        return 40
    }
    
    
    
}

extension ViewController:UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.y)
//        if scrollView.contentOffset.y < 0 {
//
//            self.headerHeightConstraint.constant += abs(scrollView.contentOffset.y)
//
//            headerView.incrementColorAlpha(offset: self.headerHeightConstraint.constant)
//
//            headerView.incrementArticleAlpha(offset: self.headerHeightConstraint.constant)
//
//        } else if scrollView.contentOffset.y > 0 && self.headerHeightConstraint.constant >= 65 {
//
//            self.headerHeightConstraint.constant -= scrollView.contentOffset.y/100
//
//            headerView.decrementColorAlpha(offset: scrollView.contentOffset.y)
//
//            headerView.decrementArticleAlpha(offset: self.headerHeightConstraint.constant)
//
//            if self.headerHeightConstraint.constant < 65 {
//
//                self.headerHeightConstraint.constant = 65
//
//            }
//
//        }
        
        updateHeaderView()
    }
    
//    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
//        if self.headerHeightConstraint.constant > 150 {
//
//            animateHeader()
//
//        }
//    }
//
//    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        if self.headerHeightConstraint.constant > 150 {
//
//            animateHeader()
//
//        }
//    }
    
}

extension ViewController:UITableViewDelegate {
    
}
