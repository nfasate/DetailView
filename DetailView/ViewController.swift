//
//  ViewController.swift
//  DetailView
//
//  Created by NILESH_iOS on 21/08/18.
//  Copyright © 2018 iDev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = UIColor.white
        
    }
    
    @IBAction func tapHereBtnTapped(_ sender: Any) {
        let controller = UserDetails()
        controller.isGroup = true
        controller.browsingImage = #imageLiteral(resourceName: "testBackground")
        controller.nameStr = "Nilesh Fasate"
        controller.userDesignation = "iOS Developer"
        self.present(controller, animated: true, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
