//
//  MeViewController.swift
//  Me
//
//  Created by Bingo on 2019/7/4.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

open class OtherViewController: BaseHiddenBarViewController {

    
     let nav = OtherNavView(frame: CGRect(x: 0, y: 0, width: kDeviceWidth, height: kDeviceNavHeight), title: "其他")
    
    override open func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.addSubview(nav)
       
        
    }
    


}
