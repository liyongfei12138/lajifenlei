//
//  OtherDetailViewController.swift
//  Garbage
//
//  Created by Bingo on 2019/7/5.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class OtherDetailViewController: BaseHiddenBarViewController {

    
    var img :String?
    var myTitle :String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
//        let nav = OtherNavView(frame: CGRect(x: 0, y: 0, width: kDeviceWidth, height: kDeviceNavHeight), title: self.myTitle ?? "" )
//
//        self.view.addSubview(nav)
        
   
        
        let imgView = UIImageView(image: UIImage(named: self.img ?? ""))
//        imgView.clipsToBounds = true
        imgView.contentMode = .scaleAspectFill
        imgView.frame = CGRect(x: 0, y: 0, width: kDeviceWidth, height: kDeviceHeight)
        self.view.addSubview(imgView)
        
        let btn = UIButton()
        btn.setImage(UIImage(named: "fanhui"), for: .normal)
        btn.frame = CGRect(x: 16, y:kDeviceStatusHeight + 5 , width: 30, height: 30)
        btn.addTarget(self, action: #selector(clickBtn(btn:)), for: .touchUpInside)
        self.view.addSubview(btn)
      
    }
    
    @objc func clickBtn(btn:UIButton)
    {
        
        self.navigationController?.popViewController(animated: true)
    }

}

extension OtherDetailViewController
{
    convenience init(img:String,title:String) {
        self.init()
        self.img = img
        self.myTitle = title
        
    }
}
