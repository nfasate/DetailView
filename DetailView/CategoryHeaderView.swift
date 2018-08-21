//
//  File.swift
//  DetailView
//
//  Created by NILESH_iOS on 21/08/18.
//  Copyright © 2018 iDev. All rights reserved.
//
import UIKit
import Foundation

class CategoryHeaderView: UIView {
    
    var imageView:UIImageView!
    var colorView:UIView!
    var bgColor = UIColor(red: 235/255, green: 96/255, blue: 91/255, alpha: 1)
    //var titleLabel = UILabel()
    var articleIcon:UIImageView!
    
//    override init(frame:CGRect, title: String) {
//        self.titleLabel.text = title.uppercaseString
//        super.init(frame: frame)
//        setUpView()
//    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    func setUpView() {
        
        self.backgroundColor = UIColor.white
        
        imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imageView)
        
        colorView = UIView()
        colorView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(colorView)
        
        let constraints:[NSLayoutConstraint] = [
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            colorView.topAnchor.constraint(equalTo: self.topAnchor),
            colorView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            colorView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            colorView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
        imageView.image = UIImage(named: "testBackground")
        imageView.contentMode = .scaleAspectFill
        
        colorView.backgroundColor = bgColor
        colorView.alpha = 1
        
        //titleLabel.translatesAutoresizingMaskIntoConstraints = false
        //self.addSubview(titleLabel)
        
        //let titlesConstraints:[NSLayoutConstraint] = [
            //titleLabel.centerXAnchor.constraintEqualToAnchor(self.centerXAnchor),
            //titleLabel.topAnchor.constraintEqualToAnchor(self.topAnchor, constant: 28),
            //]
        
        //NSLayoutConstraint.activateConstraints(titlesConstraints)
        
        //titleLabel.font = UIFont.systemFontOfSize(15)
        //titleLabel.textAlignment = .Center
        
        articleIcon = UIImageView()
        articleIcon.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(articleIcon)
        
        let imageConstraints:[NSLayoutConstraint] = [
            //articleIcon.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            //articleIcon.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            //articleIcon.widthAnchor.constraint(equalToConstant: self.frame.size.width),
            //articleIcon.heightAnchor.constraint(equalToConstant: self.frame.size.height)
            articleIcon.topAnchor.constraint(equalTo: self.topAnchor),
            articleIcon.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            articleIcon.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            articleIcon.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ]
        NSLayoutConstraint.activate(imageConstraints)
        
        articleIcon.image = UIImage(named: "article")
    }
    
    func decrementColorAlpha(offset: CGFloat) {
        
        if self.colorView.alpha <= 1 {
            
            let alphaOffset = (offset/500)/85
            
            self.colorView.alpha += alphaOffset
            
        }
        
    }
    
    func decrementArticleAlpha(offset: CGFloat) {
        
        if self.articleIcon.alpha >= 0 {
            
            let alphaOffset = max((offset - 65)/85.0, 0)
            
            self.articleIcon.alpha = alphaOffset
            
        }
        
    }
    
    func incrementColorAlpha(offset: CGFloat) {
        
        if self.colorView.alpha >= 0.6 {
            
            let alphaOffset = (offset/200)/85
            
            self.colorView.alpha -= alphaOffset
            
        }
        
    }
    
    func incrementArticleAlpha(offset: CGFloat) {
        
        if self.articleIcon.alpha <= 1 {
            
            let alphaOffset = max((offset - 65)/85, 0)
            
            self.articleIcon.alpha = alphaOffset
            
        }
        
    }
    
}
